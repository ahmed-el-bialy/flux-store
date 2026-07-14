import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/core/widgets/section_title.dart';
import 'package:flux_store/features/home/data/local/categories_data.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';
import 'package:flux_store/features/home/logic/get_all_products_cubit.dart';
import 'package:flux_store/features/home/ui/widgets/category_item.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/widgets/app_navigation_bar.dart';
import '../../../core/widgets/item_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppColors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              AppConstants.appName,
              style: AppTextStyles.fontBlue24Bold,
            ),
            centerTitle: true,
            elevation: 0,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  /// TODO: implement search functionality
                },
                icon: Icon(Icons.search, size: 24.sp),
              ),
            ],
          ),

          sliverVerticalSpacing(10),

          SliverToBoxAdapter(child: SectionTitle(sectionName: "Categories")),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categoryList.length,
                itemBuilder: (context, index) {
                  return CategoryItem(model: categoryList[index]);
                },
              ),
            ),
          ),

          sliverVerticalSpacing(5),

          SliverToBoxAdapter(
            child: SectionTitle(sectionName: "Featured Products"),
          ),
          sliverVerticalSpacing(5),
          BlocBuilder<GetAllProductsCubit, GetAllProductsState>(
            builder: (context, state) {
              if (state is GetAllProductsLoading) {
                return SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              if (state is GetAllProductsLoadedSuccessfully) {
                return ProductsGirdView(models: state.products);
              }
              if (state is GetAllProductsFailed) {
                return SliverToBoxAdapter(
                    child: Center(child: Text(state.errorMessage)));
              } else {
                return SliverToBoxAdapter(
                    child: Center(child: Text("there was an Error")));
              }
            },
          ),
          sliverVerticalSpacing(20),
        ],
      ),
      bottomNavigationBar: AppNavigationBar(activeIndex: 0),
    );
  }
}

class ProductsGirdView extends StatelessWidget {
  const ProductsGirdView({super.key, required this.models});

  final List<ProductModel> models;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 0.6,
        crossAxisCount: 2,
      ),
      itemCount: models.length,
      itemBuilder: (context, index) {
        return ItemCard(model: models[index]);
      },
    );
  }
}
