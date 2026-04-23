import 'package:flutter/material.dart';

import '../Models/Category_Model.dart';
import '../Views/Category_Products.dart';

class CategoriesListBuilder extends StatelessWidget {
  const CategoriesListBuilder({super.key, required this.categoryList});

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: categoryList.map((category) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CategoryProducts(name: category.name),
                  ),
                );
              },
              child: Chip(
                label: Text(
                  category.name,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                backgroundColor: Colors.grey[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey.shade300, width: 0.5),
                ),
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              ),
            );
          }).toList(),
        ),
      ),
    );
    }
}