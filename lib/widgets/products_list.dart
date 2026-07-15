
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';
import 'package:flux_store/features/home/data/repo/home_repo.dart';
import 'package:flux_store/features/home/data/web_services/home_web_services.dart';
import 'products_list_builder.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late Future<List<ProductModel>> future;

  @override
  void initState() {
    super.initState();
    Dio dio = Dio();
    HomeWebServices webServices = HomeWebServices(dio);
    HomeRepo repo = HomeRepo(webServices);
    future = repo.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ProductListBuilder(future: future);
  }
}
