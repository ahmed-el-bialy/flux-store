import 'package:flutter/material.dart';
import '../services/all_product_services.dart';
import 'products_list_builder.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  var future;

  @override
  void initState() {
    super.initState();
    setState(() {
      getData();
    });
  }

  void getData() {
    future = AllProductsServices().getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ProductListBuilder(future: future);
  }
}
