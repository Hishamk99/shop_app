import 'package:flutter/material.dart';
import 'package:shop_app/data/dummy_items.dart';
import 'package:shop_app/models/grocery_item_model.dart';

import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  final List<GroceryItem> _groceryItems = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Grocery'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push<GroceryItem>(
                  MaterialPageRoute(
                    builder: (context) {
                      return const NewItem();
                    },
                  ),
                ).then((value) {
                  if (value == null) {
                    return;
                  }
                  setState(() {
                    _groceryItems.add(value);
                  });
                });
              },
              icon: const Icon(
                Icons.add,
                size: 27,
              ))
        ],
      ),
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text('There is no items'),
            )
          : ListView.builder(
              itemCount: _groceryItems.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(_groceryItems[index].id),
                  onDismissed: (_){
                    setState(() {
                      _groceryItems.remove(_groceryItems[index]);
                    });
                  },
                  child: ListTile(
                    title: Text(_groceryItems[index].name),
                    leading: Container(
                      height: 24,
                      width: 24,
                      color: _groceryItems[index].category.color,
                    ),
                    trailing: Text(groceryItems[index].quantity.toString()),
                  ),
                );
              }),
    );
  }
}
