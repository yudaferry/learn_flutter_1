import 'package:flutter/material.dart';

class StyledText extends StatelessWidget {
  const StyledText({
    super.key,
    required this.text,
    required this.darkMode,
  });

  final String text;
  final bool darkMode;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: darkMode ? Colors.grey.shade300 : Colors.grey.shade900,
        fontSize: 39,
      ),
    );
  }
}
