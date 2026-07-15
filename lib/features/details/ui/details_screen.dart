import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flux_store/features/details/logic/product_details_cubit.dart';
import 'package:flux_store/features/details/ui/widgets/screen_body.dart';

import '../../../core/theming/app_colors.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: BlocBuilder<ProductDetailsCubit, ProductDetailsState>(
        builder: (context, state) {
          if (state is ProductDetailsLoading) {
            return Center(
              child: CircularProgressIndicator(color: AppColors.blue),
            );
          }

          if (state is ProductDetailsLoadedSuccessfully) {
            final product = state.product;
            return ScreenBody(model: state.product,);
          }

          if (state is ProductDetailsFailed) {
            return Center(
              child: Text(
                state.errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
            );
          }

          return const Center(child: Text('there was an error...'));
        },
      ),
    );
  }
}
