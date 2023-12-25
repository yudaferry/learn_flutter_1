import 'package:flutter/material.dart';
import 'package:test_1/expense_tracker/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 199, 173, 59),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 4, 51, 60),
  brightness: Brightness.dark,
  primary: const Color.fromARGB(255, 4, 51, 60),
  secondary: const Color.fromARGB(255, 10, 101, 119),
  tertiary: const Color.fromARGB(255, 13, 145, 134),
  onPrimary: Colors.white,
  onSecondary: Colors.white,
  onTertiary: Colors.white,
);

class ExpenseMain extends StatelessWidget {
  const ExpenseMain({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primary,
          foregroundColor: kDarkColorScheme.onPrimary,
        ),
        cardTheme: CardTheme(
          color: kDarkColorScheme.primary,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.primaryContainer,
            foregroundColor: kDarkColorScheme.onPrimary,
          ),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kDarkColorScheme.onPrimaryContainer,
                fontSize: 16,
              ),
              // bodyMedium: TextStyle(
              //   color: kDarkColorScheme.onPrimary,
              // ),
              // titleMedium: TextStyle(
              //   color: kDarkColorScheme.onPrimary,
              // ),
            ),
        // bottomSheetTheme: BottomSheetThemeData(
        //   backgroundColor: kDarkColorScheme.primary,
        // ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: kDarkColorScheme.onPrimary,
          selectionColor: kDarkColorScheme.secondary,
          selectionHandleColor: kDarkColorScheme.secondary,
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: TextStyle(color: kDarkColorScheme.onPrimary),
          counterStyle: TextStyle(color: kDarkColorScheme.onPrimary),
        ),
        canvasColor: kDarkColorScheme.primary, // Dropdown Button
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            foregroundColor:
                MaterialStatePropertyAll(kDarkColorScheme.onPrimary),
          ),
        ),
        datePickerTheme: DatePickerThemeData(
          todayBackgroundColor: MaterialStatePropertyAll(
            kDarkColorScheme.secondary,
          ),

          //   backgroundColor: kDarkColorScheme.primary,
          //   dividerColor: kDarkColorScheme.onPrimary,
          //   headerBackgroundColor: kDarkColorScheme.primary,
          //   headerForegroundColor: kDarkColorScheme.onPrimary,
          //   cancelButtonStyle: ButtonStyle(
          //     foregroundColor: MaterialStatePropertyAll(
          //       kDarkColorScheme.onPrimary,
          //     ),
          //   ),
          //   confirmButtonStyle: ButtonStyle(
          //     foregroundColor: MaterialStatePropertyAll(
          //       kDarkColorScheme.onPrimary,
          //     ),
          //   ),
          //   weekdayStyle: TextStyle(
          //     color: kDarkColorScheme.onPrimary,
          //   ),
          //   yearForegroundColor: MaterialStatePropertyAll(
          //     kDarkColorScheme.onPrimary,
          //   ),
          //   dayForegroundColor: MaterialStatePropertyAll(
          //     kDarkColorScheme.onPrimary,
          //   ),
          inputDecorationTheme: InputDecorationTheme(
            floatingLabelStyle: TextStyle(
              // valid
              color: kDarkColorScheme.onPrimary,
            ),
            hintStyle: TextStyle(
              // valid
              color: kDarkColorScheme.onPrimary,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kDarkColorScheme.onPrimary,
                width: 10,
                style: BorderStyle.solid,
              ),
            ),
            outlineBorder: BorderSide(
              color: kDarkColorScheme.onPrimary,
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: kDarkColorScheme.onPrimary,
                width: 10,
                style: BorderStyle.solid,
              ),
            ),
            activeIndicatorBorder: BorderSide(
              color: kDarkColorScheme.onPrimary,
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: kDarkColorScheme.onPrimary,
                // width: 10,
                style: BorderStyle.solid,
              ),
            ),
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primary,
        ),
        cardTheme: CardTheme(
          color: kColorScheme.primaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.primary,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      home: const Expenses(),
    );
  }
}
