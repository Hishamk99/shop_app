import 'package:flutter/material.dart';
import 'package:shop_app/data/dummy_items.dart';

import 'new_item.dart';

class GroceryList extends StatelessWidget {
  const GroceryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Grocery'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return const NewItem();
                    },
                  ),
                );
              },
              icon: const Icon(
                Icons.add,
                size: 27,
              ))
        ],
      ),
      body: ListView.builder(
          itemCount: groceryItems.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(groceryItems[index].name),
              leading: Container(
                height: 24,
                width: 24,
                color: groceryItems[index].category.color,
              ),
              trailing: Text(groceryItems[index].quantity.toString()),
            );
          }),
    );
  }
}
