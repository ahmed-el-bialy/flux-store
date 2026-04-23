import 'package:flutter/material.dart';

import '../Models/Product_Model.dart';
import '../Services/All_Product_Services.dart';
import 'Product_Card_Widget.dart';
import 'Products_List_Builder.dart';

class ProductsList extends StatefulWidget {
  ProductsList({super.key});

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
