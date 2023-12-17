import 'package:flutter/material.dart';
import 'package:test_1/expense_tracker/expenses.dart';
import 'package:test_1/home_page.dart';
import 'package:test_1/image_roller/main_image_roller.dart';
import 'package:test_1/quiz_app/quiz_app.dart';

class Menu {
  Menu(this.widget, this.icon);

  final Widget widget;
  final IconData icon;
}

Map<String, Menu> floatingMenu = {
  "home": Menu(const HomePage(), Icons.home),
  "roller": Menu(const MainImageRoller(), Icons.image),
  "quiz": Menu(const QuizApp(), Icons.local_pizza),
  "expense": Menu(const Expenses(), Icons.attach_money)
};
