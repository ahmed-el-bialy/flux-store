import 'package:flutter/material.dart';

import '../../features/home/data/models/product_model.dart';
import 'product_card.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.models});

  final List<ProductModel> models;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.57,
        crossAxisCount: 2,
      ),
      itemCount: models.length,
      itemBuilder: (context, index) {
        return ProductCard(model: models[index]);
      },
    );
  }
}
