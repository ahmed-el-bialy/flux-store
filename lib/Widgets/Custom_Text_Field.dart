import 'package:flutter/material.dart';
import 'package:flux_store/Models/Category_Model.dart';
import 'package:flux_store/Views/Category_Products.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.categoryList});

  final List<CategoryModel> categoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        onSubmitted: (value) {
          bool isFound = categoryList.any(
            (v) => v.name.toLowerCase() == value.toLowerCase(),
          );
          if (isFound) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return CategoryProducts(name: value);
                },
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                duration: Duration(seconds: 3),
                content: Text('Category "$value" not found or not exist!'),
              ),
            );
          }
        },

        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        ),
      ),
    );
  }
}
