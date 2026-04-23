import 'package:flutter/material.dart';
import 'package:flux_store/Services/Category_Products_Services.dart';
import 'package:flux_store/Widgets/Products_List_Builder.dart';
import 'package:flux_store/Widgets/ServicesBar.dart';

import '../Constants/Constants.dart';

class CategoryProducts extends StatefulWidget {
  CategoryProducts({super.key, required this.name});

  final String name;
  static String id = "Category Products View";

  @override
  State<CategoryProducts> createState() => _CategoryProductsState();
}

class _CategoryProductsState extends State<CategoryProducts> {
  var future;

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  void getData() {
    future = CategoryProductsServices().getCategoriesProducts(
      category: widget.name,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(widget.name, style: TextStyle(color: Colors.white)),
        backgroundColor: Color(kMainColor),
        centerTitle: true,
      ),

      body: Column(
        children: [
          ProductListBuilder(future: future),

          ServicesBar(),
        ],
      ),
    );
  }
}
