import 'package:e_commerce_app/models/category.dart';
import 'package:e_commerce_app/pages/category_page.dart';
import 'package:flutter/material.dart';

class CatListView extends StatelessWidget {
  const CatListView({super.key});

  final List<CategoryModel> categories = const [
    CategoryModel(name: 'Electronics', icon: Icons.computer),
    CategoryModel(name: 'sports', icon: Icons.sports),
    CategoryModel(name: 'furniture', icon: Icons.chair),
    CategoryModel(name: 'toys', icon: Icons.toys),
    CategoryModel(name: 'kitchen', icon: Icons.kitchen),
    CategoryModel(name: 'books', icon: Icons.book),
    CategoryModel(name: 'clothes', icon: Icons.accessibility_new_sharp),
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemCount: categories.length,
        itemBuilder: (ctx, index) => SizedBox(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  CategoryPage(category: categories[index])));
                    },
                    child: Icon(
                      categories[index].icon,
                      size: 60,
                    ),
                  ),
                ),
              ),
              Text(
                categories[index].name,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
