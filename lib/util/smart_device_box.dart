import 'package:flutter/material.dart';

class SmartDeviceBox extends StatelessWidget {
  final String deviceName;
  final String iconPath;
  final bool isOn;
  final Function(bool) onChanged;

  const SmartDeviceBox({
    Key? key,
    required this.deviceName,
    required this.iconPath,
    required this.isOn,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onChanged(!isOn),
      child: Card(
        elevation: isOn ? 4 : 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: isOn ? Colors.white : Colors.grey[200],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 48, // Set the width to fit your design
              color: isOn ? Theme.of(context).colorScheme.primary : Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              deviceName,
              style: TextStyle(
                color: isOn ? Colors.black : Colors.grey,
              ),
            ),
            Switch(
              value: isOn,
              onChanged: (val) => onChanged(val),
              activeColor: Theme.of(context).colorScheme.primary,
            ),
          ],
        ),
      ),
    );
  }
}
