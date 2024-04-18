import 'package:flutter/material.dart';
import '/pages/devices_connected_page.dart'; // Import the DevicesConnectedPage

class TopBar extends StatelessWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              // Navigate to DevicesConnectedPage on menu button press
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => DevicesConnectedPage(),
              ));
            },
            // Use Image.asset to load your custom menu icon image
            child: Image.asset('lib/icons/menu.png', height: 30),
          ),
          GestureDetector(
            onTap: () {
              // Handle profile button press
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('lib/icons/profile_avatar.png'),
              radius: 22,
            ),
          ),
        ],
      ),
    );
  }
}
