import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/details/logic/product_details_cubit.dart';
import 'package:flux_store/features/details/ui/widgets/screen_body.dart';
import 'package:flux_store/features/details/ui/widgets/sticky_bottom_cta.dart';
import '../../../core/theming/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
      builder: (context, state) {
        if (state is ProductDetailsLoading) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Center(
              child: CircularProgressIndicator(color: AppColors.blue),
            ),
          );
        }

        if (state is ProductDetailsLoadedSuccessfully) {
          final stockCount = state.product.stock ?? 0;
          return Scaffold(
            extendBody: true,
            backgroundColor: AppColors.white,
            body: ScreenBody(product: state.product),
            bottomNavigationBar: StickyBottomCTA(stock: stockCount),
          );
        }

        if (state is ProductDetailsFailed) {
          return Scaffold(
            backgroundColor: AppColors.white,
            body: Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            ),
          );
        }

        return const Scaffold(
          body: Center(child: Text('there was an error...')),
        );
      },
    );
  }
}
