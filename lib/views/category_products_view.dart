import 'package:flutter/material.dart';
import 'package:flux_store/services/category_products_services.dart';
import 'package:flux_store/widgets/products_list_builder.dart';
import 'package:flux_store/widgets/services_bar.dart';
import '../core/constants/constants.dart';

class CategoryProductsView extends StatefulWidget {
  const CategoryProductsView({super.key, required this.name});

  final String name;
  static String id = "Category Products View";

  @override
  State<CategoryProductsView> createState() => _CategoryProductsViewState();
}

class _CategoryProductsViewState extends State<CategoryProductsView> {
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
