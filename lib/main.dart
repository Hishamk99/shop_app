import 'package:flutter/material.dart';

import 'widgets/drocery_list.dart';

void main() {
  runApp(const ShopApp());
}
class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GroceryList(),

    );
  }
}



