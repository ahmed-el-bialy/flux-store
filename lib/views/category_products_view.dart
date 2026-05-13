import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flux_store/data/models/product_model.dart';
import 'package:flux_store/data/repo/repo.dart';
import 'package:flux_store/data/web_services/web_services.dart';
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
  late Future<List<ProductModel>> future;

  @override
  void initState() {
    super.initState();
    Dio dio = Dio();
    WebServices webServices = WebServices(dio);
    Repo repo = Repo(webServices);
    future = repo.getProductsByCategory(category: widget.name);
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
