import 'package:flutter/material.dart';

class DevicesConnectedPage extends StatefulWidget {
  @override
  _DevicesConnectedPageState createState() => _DevicesConnectedPageState();
}

class _DevicesConnectedPageState extends State<DevicesConnectedPage> {
  // Example data for connected and not connected devices
  List<Map<String, dynamic>> connectedDevices = [
    {'name': 'Smart TV', 'location': 'Bedroom', 'isConnected': true},
    {'name': 'Smart TV', 'location': 'Living Room', 'isConnected': true},
    // Add more connected devices here
  ];

  List<Map<String, dynamic>> notConnectedDevices = [
    {'name': 'Smart Light', 'isConnected': false},
    {'name': 'Smart AC', 'isConnected': false},
    // Add more not connected devices here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Match the background with other pages
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Devices Connected',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24, // Adjust the font size as needed
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {
              // Handle three-dot menu button press
            },
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ...connectedDevices.map((device) => ListTile(
                  title: Text(device['name']),
                  subtitle: Text(device['location']),
                  trailing: Switch(
                    value: device['isConnected'],
                    onChanged: (value) {
                      setState(() {
                        device['isConnected'] = value;
                      });
                    },
                  ),
                )),
            ...notConnectedDevices.map((device) => ListTile(
                  title: Text(device['name']),
                  trailing: Switch(
                    value: device['isConnected'],
                    onChanged: null, // Switch is disabled for not connected devices
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
