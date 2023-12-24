import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:test_1/expense_tracker/models/expense.dart';

var formattedDate = DateFormat.yMMMd();

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.onAddExpense});

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  // String _enteredTitle = '';

  // void _saveTitleInput(String inputValue) {
  //   _enteredTitle = inputValue;
  // }

  // void _presentDatePicker() {
  //   final now = DateTime.now();
  //   final firstDate = DateTime(now.year - 1, now.month, now.day);
  //   showDatePicker(
  //     context: context,
  //     initialDate: now,
  //     firstDate: firstDate,
  //     lastDate: now,
  //   ).then((value) {
  //     setState(() {
  //       _selectedDate = value;
  //     });
  //   });
  // }

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submitExpenseData() {
    final enteredAmount = double.tryParse(_amountController.text);
    if (_isValid(enteredAmount)) {
      widget.onAddExpense(
        Expense(
            title: _titleController.text,
            date: _selectedDate!,
            amount: enteredAmount!,
            category: _selectedCategory),
      );
    }
  }

  bool _isValid(double? enteredAmount) {
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: const Text('Invalid Input'),
          content: const Text('Please make sure enter valid data!'),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(ctx);
                },
                child: const Text('Close'))
          ],
        ),
      );
      return false;
    }
    return true;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            // onChanged: _saveTitleInput,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      _selectedDate == null
                          ? 'No date selected!'
                          : formattedDate.format(_selectedDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              // DropdownMenu(
              //   initialSelection: _selectedCategory,
              //   onSelected: (value) {
              //     if (value == null) return;
              //     setState(() => _selectedCategory = value);
              //   },
              //   dropdownMenuEntries: Category.values
              //       .map(
              //         (category) => DropdownMenuEntry(
              //           value: category,
              //           label: category.name.toUpperCase(),
              //         ),
              //       )
              //       .toList(),
              // ),
              DropdownButton(
                value: _selectedCategory,
                items: Category.values
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category.name.toUpperCase()),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _selectedCategory = value;
                  });
                },
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _submitExpenseData,
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
