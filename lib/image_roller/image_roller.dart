import 'dart:math';

import 'package:flutter/material.dart';
import 'package:test_1/image_roller/styled_text.dart';

final randomizer = Random();

class ImageRoller extends StatefulWidget {
  const ImageRoller(this.darkMode, {super.key});
  final bool darkMode;

  @override
  State<ImageRoller> createState() => _ImageRollerState();
}

class _ImageRollerState extends State<ImageRoller> {
  var imageRoll = 1;
  void rollImage() {
    setState(() {
      imageRoll = randomizer.nextInt(3) + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/image-$imageRoll.jpg',
          width: 300,
        ),
        const SizedBox(height: 100),
        TextButton(
          onPressed: rollImage,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(30),
            shape: const BeveledRectangleBorder(
              borderRadius: BorderRadius.all(Radius.zero),
            ),
            backgroundColor:
                widget.darkMode ? Colors.green.shade700 : Colors.green.shade400,
          ),
          child: StyledText(
            text: "Roll Image",
            darkMode: widget.darkMode,
          ),
        )
      ],
    );
  }
}
