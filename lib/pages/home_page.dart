import 'package:flutter/material.dart';
import '/util/smart_device_box.dart';
import '/widgets/top_bar.dart';
import '/widgets/device_grid.dart';
import 'temperature_control_page.dart';

class HomePage extends StatefulWidget {
  final String userName; // Added to accept username dynamically
  const HomePage({super.key, this.userName = "User"}); // Default to "User"

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // list of smart devices
  List mySmartDevices = [
    ["Smart Light", "lib/icons/light-bulb.png", true],
    ["Smart AC", "lib/icons/air-conditioner.png", false],
    ["Smart TV", "lib/icons/smart-tv.png", false],
    ["Smart Fan", "lib/icons/fan.png", false],
  ];

  void powerSwitchChanged(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          children: [
            const TopBar(),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Welcome Home,",
                        style: TextStyle(
                          color: Colors.black45,
                          fontSize: 24,
                        ),
                      ),
                      Text(
                        widget.userName, // Use the dynamic username
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Image.asset(
                    'lib/icons/smart-home.png',
                    height: 80,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: DeviceGrid(
                devices: mySmartDevices,
                onToggle: powerSwitchChanged,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to the TemperatureControlPage
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => TemperatureControlPage(),
                  ));
                },
                child: const Text('Go to Temperature Control'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}