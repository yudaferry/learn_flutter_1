import 'package:flutter/material.dart';
import 'package:test_1/Groceries/data/dummy_items.dart';
import 'package:test_1/Groceries/screen/new_item.dart';

class ListGroceries extends StatefulWidget {
  const ListGroceries({super.key});

  @override
  State<ListGroceries> createState() => _ListGroceriesState();
}

class _ListGroceriesState extends State<ListGroceries> {
  final _groceryItems = [];

  void _addItem() async {
    final newItem = await Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => const NewItem()),
    );

    if (newItem == null) return;

    setState(() {
      _groceryItems.add(newItem);
    });
  }

  Widget _displayedScreen() {
    if (_groceryItems.isEmpty) {
      return Center(
        child: Text(
          'No Grocery items!',
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
              ),
        ),
      );
      // return Container(
      //   alignment: Alignment.center,
      //   child: Text(
      //     'No Grocery items!',
      //     style: Theme.of(context).textTheme.headlineMedium!.copyWith(
      //           color: Theme.of(context).colorScheme.onSecondaryContainer,
      //         ),
      //   ),
      // );
    }

    return ListView.builder(
        itemCount: _groceryItems.length,
        itemBuilder: (context, index) => Dismissible(
              onDismissed: (direction) {
                setState(() {
                  _groceryItems.remove(_groceryItems[index]);
                });
              },
              key: ValueKey(_groceryItems[index].id),
              child: ListTile(
                title: Text(_groceryItems[index].name),
                leading: Container(
                  width: 24,
                  height: 24,
                  color: _groceryItems[index].category.categoryColor,
                ),
                trailing: Text(_groceryItems[index].quantity.toString()),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: _displayedScreen(),
    );
  }
}
