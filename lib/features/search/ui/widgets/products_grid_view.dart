import 'package:flutter/material.dart';

import '../../../../core/widgets/product_card.dart';
import '../../../home/data/models/product_model.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key, required this.models});

  final List<ProductModel> models;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
