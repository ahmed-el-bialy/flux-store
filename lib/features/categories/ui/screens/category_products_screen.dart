import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/core/widgets/loading_products_grid_view.dart';
import 'package:flux_store/core/widgets/products_grid_view.dart';
import 'package:flux_store/features/categories/logic/products_by_category_cubit.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/theming/app_text_styles.dart';

class CategoryProductsScreen extends StatelessWidget {
  const CategoryProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              AppConstants.appName,
              style: AppTextStyles.fontBlue23Bold,
            ),
            centerTitle: true,
            elevation: 0,
            pinned: true,
          ),

          BlocBuilder<ProductsByCategoryCubit, ProductsByCategoryState>(
            builder: (context, state) {
              if (state is ProductsByCategoryLoading) {
                return LoadingProductsGridView();
              }
              if (state is ProductsByCategorySuccess) {
                return ProductsGridView(models: state.products);
              }
              if (state is ProductsByCategoryFailed) {
                return SliverToBoxAdapter(
                  child: Center(child: Text(state.errorMessage)),
                );
              } else {
                return SliverToBoxAdapter(
                  child: Center(child: Text("there was an Error")),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
