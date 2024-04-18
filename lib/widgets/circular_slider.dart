import 'package:flutter/material.dart';
import '/util/slider_painter.dart'; // Ensure this import is correct
import 'dart:math' as math;

class CircularSlider extends StatefulWidget {
  final double initialValue;
  final ValueChanged<double> onChanged;

  const CircularSlider({
    Key? key,
    required this.initialValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CircularSliderState createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  late double _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _updateValue(Offset localPosition, Size size) {
    // Calculate the touch angle
    final Offset center = Offset(size.width / 2, size.height / 2);
    final double dx = localPosition.dx - center.dx;
    final double dy = localPosition.dy - center.dy;
    final double angle = math.atan2(dy, dx);

    // Normalize the angle to a value between 0 and 1 for the slider
    // The top of the circle (12 o'clock) is the starting point for the slider
    double normalizedAngle = (angle >= 0) ? angle : (2 * math.pi + angle);
    // Convert angle range from (0, 2π) to (0, 1) considering only top half of the circle
    double sliderValue = (normalizedAngle % math.pi) / math.pi;

    // The slider value should be between 0 and 1 for the top half of the circle
    if (sliderValue <= 0.5) {
      setState(() {
        _currentValue = sliderValue * 2; // Since we're only using half the circle, multiply by 2
        widget.onChanged(_currentValue); // Call the callback
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        _updateValue(details.localPosition, context.size!);
      },
      child: CustomPaint(
        painter: SliderPainter(
          value: _currentValue,
          activeColor: Colors.blue,
          inactiveColor: Colors.blue.shade100,
          strokeWidth: 15.0,
        ),
        child: Container(
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
