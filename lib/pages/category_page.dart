import 'package:e_commerce_app/models/category.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(category.name),
      ),
      body: Center(
        child: Text(category.name),
      ),
    );
  }
}
