import 'package:flutter/material.dart';
import 'package:test_1/image_roller/gradient_container.dart';

class MainImageRoller extends StatelessWidget {
  const MainImageRoller({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // body: GradientContainer([Colors.black87, Colors.green.shade700], true),
        body: GradientContainer.darkMode(),
        // body: GradientContainer.lightMode(),
      ),
    );
  }
}
