import 'package:flutter/material.dart';
import '/util/smart_device_box.dart';

class DeviceGrid extends StatelessWidget {
  final List devices;
  final Function(bool, int) onToggle;

  const DeviceGrid({
    Key? key,
    required this.devices,
    required this.onToggle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: devices.length,
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / 1.2,
      ),
      itemBuilder: (BuildContext context, int index) {
        return SmartDeviceBox(
          deviceName: devices[index][0],
          iconPath: devices[index][1],
          isOn: devices[index][2],
          onChanged: (value) => onToggle(value, index),
        );
      },
    );
  }
}
