import 'package:flutter/material.dart';
import 'pages/home_page.dart';
import 'pages/temperature_control_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Set up the theme data to be used throughout the app
    final ThemeData theme = ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Smart Home',
      theme: theme,
      home: const HomePage(userName: 'Garrett Reynolds'), // Set the HomePage as the initial route
      // You can add routes here if you want to navigate to the TemperatureControlPage or other pages.
      routes: {
        '/temperature': (context) => TemperatureControlPage(),
        // Define other routes here as needed
      },
    );
  }
}
