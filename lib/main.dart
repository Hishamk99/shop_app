import 'package:flutter/material.dart';

import 'widgets/drocery_list.dart';

void main() {
  runApp(const ShopApp());
}
class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      theme: ThemeData.dark().copyWith(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color.fromARGB(255, 49, 57, 47),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 0, 0, 0),
          surface: const Color.fromARGB(255, 44, 50, 60),
          brightness: Brightness.dark
        )
      ),
      debugShowCheckedModeBanner: false,
      home: const GroceryList(),

    );
  }
}



