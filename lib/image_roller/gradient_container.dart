import 'package:flutter/material.dart';
import 'package:test_1/image_roller/image_roller.dart';

class GradientContainer extends StatelessWidget {
  // const GradientContainer({super.key, required this.gradientColors});
  // final List<Color> gradientColors;
  GradientContainer(this.gradientColors, this.darkMode, {super.key});
  GradientContainer.darkMode({super.key})
      : gradientColors = [
          Colors.black87,
          Colors.green.shade700,
        ],
        darkMode = true;
  GradientContainer.lightMode({super.key})
      : gradientColors = [
          Colors.white30,
          Colors.green.shade700,
        ],
        darkMode = false;
  final List<Color> gradientColors;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
        ),
      ),
      child: Center(
          // child: StyledText(text: "wow wow", darkMode: darkMode),
          child: ImageRoller(darkMode)),
    );
  }
}
