import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/search/ui/widgets/products_grid_view.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../logic/search_cubit.dart';
import 'loading_products_grid_vie.dart';

class BuildSearchResultsGrid extends StatelessWidget {
  const BuildSearchResultsGrid({super.key, required this.searchCubit});

  final SearchCubit searchCubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      bloc: searchCubit,
      builder: (context, state) {
        if (state is SearchLoading) {
          return LoadingProductsGridView();
        }

        if (state is SearchSuccess) {
          if (state.products.isNotEmpty) {
            return Container(
              color: AppColors.white,
              child: ProductsGridView(models: state.products),
            );
          } else {
            return Container(
              color: AppColors.white,
              child: Center(
                child: Text(
                  'No results found.',
                  style: AppTextStyles.fontBlue14Medium,
                ),
              ),
            );
          }
        }

        if (state is SearchFailed) {
          return Center(
            child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        return Container(color: AppColors.white);
      },
    );
  }
}
