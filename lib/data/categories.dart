import 'package:flutter/material.dart';
import 'package:shop_app/models/category_model.dart';

const Map<Categories, CategoryModel> categories = {
  Categories.vegetables: CategoryModel(
    'vegetables',
    Color.fromARGB(255, 0, 255, 128),
  ),
  Categories.fruit: CategoryModel(
    'fruit',
    Color.fromARGB(255, 145, 255, 0),
  ),
  Categories.meat: CategoryModel(
    'meat',
    Color.fromARGB(255, 255, 102, 0),
  ),
  Categories.dairy: CategoryModel(
    'dairy',
    Color.fromARGB(255, 0, 208, 255),
  ),
  Categories.carbs: CategoryModel(
    'carbs',
    Color.fromARGB(255, 0, 60, 255),
  ),
  Categories.sweets: CategoryModel(
    'sweets',
    Color.fromARGB(255, 255, 149, 0),
  ),
  Categories.spices: CategoryModel(
    'spices',
    Color.fromARGB(255, 255, 187, 0),
  ),
  Categories.convenience: CategoryModel(
    'convenience',
    Color.fromARGB(255, 191, 0, 255),
  ),
  Categories.hygiene: CategoryModel(
    'hygiene',
    Color.fromARGB(255, 149, 0, 255),
  ),
  Categories.other: CategoryModel(
    'other',
    Color.fromARGB(255, 0, 225, 255),
  ),
};
