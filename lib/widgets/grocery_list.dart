import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shop_app/data/categories.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/models/grocery_item_model.dart';
import 'package:http/http.dart' as http;
import 'new_item.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  List<GroceryItem> _groceryItems = [];
  bool isLoading = true;
  String? errorMessage;
  void loadData() async {
    //try {
      final http.Response response = await http.get(
          Uri.parse('https://shop-93315-default-rtdb.firebaseio.com/ss.json'));
      if (response.statusCode >= 400) {
        setState(() {
          errorMessage = 'There was an error';
        });

        return;
      }
      if (response.body == 'null') // or decode(response.body) == null
      {
        setState(() {
          isLoading = false;
        });
        return;
      }
      final Map<String, dynamic> data = jsonDecode(response.body);
      final List<GroceryItem> items = [];
      for (var item in data.entries) {
        final CategoryModel category = categories.entries
            .firstWhere(
              (element) => element.value.title == item.value['category'],
              //orElse: () => ;
            )
            .value;
        items.add(
          GroceryItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'].toString(),
            category: category,
          ),
        );
        setState(() {
          _groceryItems = items;
        });
      }
    // } catch (e) {
    //   setState(() {
    //       errorMessage = 'There was an error';
    //     });
    // }
  }

  @override
  void initState() {
    super.initState();
    loadData();
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Grocery'),
        actions: [
          IconButton(
            onPressed: addItem,
            icon: const Icon(
              Icons.add,
              size: 27,
            ),
          )
        ],
      ),
      body: _groceryItems.isEmpty
          ? const Center(
              child: Text('There is no Items'),
            )
          : errorMessage != null
              ? Center(child: Text(errorMessage!),)
              : isLoading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      itemCount: _groceryItems.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: ValueKey(_groceryItems[index].id),
                          onDismissed: (_) {
                            _removeItem(_groceryItems[index]);
                          },
                          child: ListTile(
                            title: Text(_groceryItems[index].name),
                            leading: Container(
                              height: 24,
                              width: 24,
                              color: _groceryItems[index].category.color,
                            ),
                            trailing: Text(
                              _groceryItems[index].quantity.toString(),
                            ),
                          ),
                        );
                      },
                    ),
    );
  }

  Future<void> _removeItem(GroceryItem item) async {
    final index = _groceryItems.indexOf(item);

    final Uri uri = Uri.parse(
        'https://shop-93315-default-rtdb.firebaseio.com/ss${item.id}.json');

    final res = await http.delete(uri);
    if (res.statusCode >= 400) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Opps There is an error',
          ),
        ),
      );
      setState(() {
        _groceryItems.insert(index, item);
      });
    }
  }

  void addItem() async {
    final newItem = await Navigator.of(context).push<GroceryItem>(
      MaterialPageRoute(
        builder: (context) {
          return const NewItem();
        },
      ),
    );
    if (newItem == null) {
      return;
    }
    setState(() {
      _groceryItems.add(newItem);
    });
  }
}
