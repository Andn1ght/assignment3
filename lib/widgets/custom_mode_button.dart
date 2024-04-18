import 'package:flutter/material.dart';

class CustomModeButton extends StatefulWidget {
  final String modeName;
  final bool isActive;
  final VoidCallback onTap;
  final double? width;

  const CustomModeButton({
    Key? key,
    required this.modeName,
    required this.isActive,
    required this.onTap,
    this.width,
  }) : super(key: key);

  @override
  _CustomModeButtonState createState() => _CustomModeButtonState();
}

class _CustomModeButtonState extends State<CustomModeButton> {
  bool _isPressed = false;

  void _handleTapDown(TapDownDetails details) {
    setState(() => _isPressed = true);
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() => _isPressed = false);
  }

  void _handleTapCancel() {
    setState(() => _isPressed = false);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _handleTapDown,
      onTapUp: _handleTapUp,
      onTapCancel: _handleTapCancel,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: _isPressed ? Colors.grey[200] : (widget.isActive ? Colors.black : Colors.white),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade400, width: 1),
          boxShadow: [
            if (!_isPressed)
              BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(0, 2),
                blurRadius: 4,
              ),
          ],
        ),
        child: Text(
          widget.modeName,
          style: TextStyle(
            color: widget.isActive ? Colors.white : Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
