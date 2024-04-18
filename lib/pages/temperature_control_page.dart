import 'package:flutter/material.dart';
import '/widgets/circular_slider.dart';
import '/widgets/custom_mode_button.dart';

class TemperatureControlPage extends StatefulWidget {
  @override
  _TemperatureControlPageState createState() => _TemperatureControlPageState();
}

class _TemperatureControlPageState extends State<TemperatureControlPage> {
  double _currentTemperature = 22.0; // Default temperature, dynamic

  bool isHeatingOn = false;
  bool isCoolingOn = false;
  bool isAirwaveOn = false;

  @override
  Widget build(BuildContext context) {
    double sliderValue = (_currentTemperature - 16) / (30 - 16);

    return Scaffold(
      backgroundColor: Colors.white, // Use the actual color from the design
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Column(
          children: [
            Text(
              'Temperature',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Living Room',
              style: TextStyle(
                color: Colors.black.withOpacity(0.6),
                fontSize: 16,
              ),
            ),
          ],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 10),
                  Text(
                    '${_currentTemperature.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 96, fontWeight: FontWeight.w300),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Current Temp 24°C • Current Humidity 54%',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 20),
                  CircularSlider(
                    initialValue: sliderValue,
                    onChanged: (newValue) {
                      setState(() {
                        _currentTemperature = 16 + (newValue * (30 - 16));
                      });
                    },
                  ),
                ],
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                bool isWideScreen = constraints.maxWidth > 600;
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomModeButton(
                      modeName: 'Heating',
                      isActive: isHeatingOn,
                      onTap: () => setState(() => isHeatingOn = !isHeatingOn),
                    ),
                    CustomModeButton(
                      modeName: 'Cooling',
                      isActive: isCoolingOn,
                      onTap: () => setState(() => isCoolingOn = !isCoolingOn),
                    ),
                    CustomModeButton(
                      modeName: 'Airwave',
                      isActive: isAirwaveOn,
                      onTap: () => setState(() => isAirwaveOn = !isAirwaveOn),
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
