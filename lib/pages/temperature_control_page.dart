import 'package:flutter/material.dart';
import '/widgets/circular_slider.dart';
import '/widgets/custom_mode_button.dart';

class TemperatureControlPage extends StatefulWidget {
  @override
  _TemperatureControlPageState createState() => _TemperatureControlPageState();
}

class _TemperatureControlPageState extends State<TemperatureControlPage> {
  double _currentTemperature = 22.0; // Default temperature, which can be dynamic
  bool isHeatingOn = false;
  bool isCoolingOn = false;
  bool isAirwaveOn = false;

  @override
  Widget build(BuildContext context) {
    double sliderValue = (_currentTemperature - 16) / (30 - 16);

    return Scaffold(
      backgroundColor: Color(0xFFEFEFEF), // Use the actual color from the design
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.account_circle, color: Colors.black),
            onPressed: () {
              // Handle profile button press
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 20),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Living Room',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  Text(
                    '${_currentTemperature.toStringAsFixed(1)}°C',
                    style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
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
            SizedBox(height: 20),
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
                      width: isWideScreen ? 120 : null,
                    ),
                    CustomModeButton(
                      modeName: 'Cooling',
                      isActive: isCoolingOn,
                      onTap: () => setState(() => isCoolingOn = !isCoolingOn),
                      width: isWideScreen ? 120 : null,
                    ),
                    CustomModeButton(
                      modeName: 'Airwave',
                      isActive: isAirwaveOn,
                      onTap: () => setState(() => isAirwaveOn = !isAirwaveOn),
                      width: isWideScreen ? 120 : null,
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
