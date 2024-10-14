Circular Waved Indicator Widget

The Circular Waved Indicator Widget is a highly customizable Flutter widget that visually represents a percentage value with a beautiful, animated wave effect. Perfect for dashboards, fitness apps, and progress indicators, this widget provides a unique and engaging way to display data while offering flexibility to adapt to your app’s design and theme.

✨ Features

• Customizable Design:

Modify the background color, border color, border width, and liquid fill color to suit your UI.
• Optional Animation:
Add a smooth, fluid wave animation to enhance user interaction. You can enable or disable the animation as needed.
• Percentage Display:
Easily display the percentage value in the center using a customizable widget (e.g., Text or RichText).
• Flexible Sizing:
Adjust the widget size to fit into any layout or screen size.

🚀 Getting Started

Installation

Add the following to your pubspec.yaml under dependencies:

dependencies:
circular_waved_indicator: ^0.0.1

Then, run the following command in your terminal:

flutter pub get

Import the package:

import 'package:circular_waved_indicator/circular_waved_indicator.dart';

📋 Usage

Here’s a basic example demonstrating how to use the Circular Waved Indicator widget:

import 'package:flutter/material.dart';
import 'package:circular_waved_indicator/circular_waved_indicator.dart';

void main() {
runApp(const MyApp());
}

class MyApp extends StatelessWidget {
const MyApp({Key? key}) : super(key: key);

@override
Widget build(BuildContext context) {
return MaterialApp(
home: Scaffold(
appBar: AppBar(title: const Text('Circular Waved Indicator')),
body: Center(
child: CustomLiquidCircularIndicator(
percentage: 75.0, // Set the progress value (0-100)
backgroundColor: Colors.white,
borderColor: Colors.blueAccent,
borderWidth: 5.0,
withAnimation: true, // Enable or disable animation
centerWidget: const Text(
'75%',
style: TextStyle(
fontSize: 20,
fontWeight: FontWeight.bold,
),
),
),
),
),
);
}
}

Parameters

Property Description Type Default
percentage The percentage to display inside the circle. double Required
backgroundColor Background color of the circular indicator. Color Colors.white
borderColor Color of the circular border. Color Colors.grey
borderWidth Width of the border surrounding the circle. double 5.0
centerWidget Optional widget to display inside the circle (e.g., percentage text). Widget? null
withAnimation Enables or disables the wave animation. bool true

📂 Example

For a complete example, refer to the /example folder in the GitHub repository.

🔧 Additional Information

Feel free to contribute or report issues via the GitHub issue tracker. We welcome your feedback and pull requests!

For more details about Flutter packages, see the Flutter documentation.

This version is more polished, engaging, and comprehensive. You’ll just need to replace the GitHub links with your actual repository URLs before publishing.
