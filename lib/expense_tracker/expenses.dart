import 'package:flutter/material.dart';
import 'package:test_1/expense_tracker/widgets/expenses_list.dart';
import 'package:test_1/expense_tracker/models/expense.dart';
import 'package:test_1/expense_tracker/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter course',
      date: DateTime.now(),
      amount: 19.99,
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      date: DateTime.now(),
      amount: 15.49,
      category: Category.leisure,
    ),
    Expense(
      title: 'Bali',
      date: DateTime.now(),
      amount: 34.49,
      category: Category.travel,
    ),
  ];

  void _openAddOverlay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green.shade400,
          title: const Text('Expense Tracker'),
          actions: [
            IconButton(
              onPressed: _openAddOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.lightGreen.shade500,
                Colors.lightGreen.shade300,
                Colors.lightGreen.shade100,
                Colors.lightGreen.shade300,
                Colors.lightGreen.shade500,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              const Text('The Chart'),
              Expanded(
                child: ExpensesList(expenses: _registeredExpenses),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
