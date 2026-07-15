import 'package:flutter/material.dart';
import 'package:flux_store/core/widgets/loading_card.dart';

class LoadingProductsGridView extends StatelessWidget {
  const LoadingProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: .6,
      ),
      itemBuilder: (context, index) {
        return LoadingCard();
      },
    );
  }
}
