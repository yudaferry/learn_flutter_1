import 'package:flutter/material.dart';
import 'package:test_1/Groceries/groceries.dart';
import 'package:test_1/expense_tracker/expense_main.dart';
import 'package:test_1/home_page.dart';
import 'package:test_1/image_roller/main_image_roller.dart';
import 'package:test_1/meals_app/meals.dart';
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
  "expense": Menu(const ExpenseMain(), Icons.attach_money),
  "meals": Menu(const Meals(), Icons.fastfood),
  "Groceries": Menu(const Groceries(), Icons.shopping_basket)
};
