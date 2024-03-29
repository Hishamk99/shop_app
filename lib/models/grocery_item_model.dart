import 'package:shop_app/models/category_model.dart';

class GroceryItem {
  final String id;
  final String name;
  final String quantity;
  final CategoryModel category;

  const GroceryItem(
      {required this.id,
      required this.name,
      required this.quantity,
      required this.category});
}
