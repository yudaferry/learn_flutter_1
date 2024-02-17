import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:test_1/Groceries/screen/list_groceries.dart';

final theme = ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: const Color.fromARGB(255, 147, 229, 250),
        brightness: Brightness.dark,
        surface: const Color.fromARGB(255, 42, 51, 59)),
    textTheme: GoogleFonts.robotoTextTheme(),
    scaffoldBackgroundColor: const Color.fromARGB(255, 50, 58, 60));

class Groceries extends StatelessWidget {
  const Groceries({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Groceries',
      theme: theme,
      debugShowCheckedModeBanner: false,
      home: const ListGroceries(),
    );
  }
}
