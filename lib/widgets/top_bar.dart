import 'package:flutter/material.dart';

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
              // Handle menu button press
            },
            // Use Image.asset to load your custom icon image
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
