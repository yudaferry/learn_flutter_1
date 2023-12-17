import 'package:flutter/material.dart';
import 'package:test_1/expense_tracker/models/expense.dart';
import 'package:test_1/expense_tracker/widgets/expense_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (ctx, index) => ExpenseItem(expenses[index]),
        itemCount: expenses.length);
  }
}
