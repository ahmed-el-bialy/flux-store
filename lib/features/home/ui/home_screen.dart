import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/networking/dio_factory.dart';
import 'package:flux_store/core/theming/app_colors.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/core/widgets/section_title.dart';
import 'package:flux_store/features/categories/data/local/categories_data.dart';
import 'package:flux_store/features/home/logic/get_all_products_cubit.dart';
import 'package:flux_store/features/home/ui/widgets/category_item.dart';
import 'package:flux_store/features/search/data/repo/search_repo.dart';
import 'package:flux_store/features/search/data/web_services/search_web_services.dart';
import 'package:flux_store/features/search/ui/custom_search_delegate.dart';

import '../../../core/helper/spacing.dart';
import '../../../core/widgets/app_navigation_bar.dart';
import '../../../core/widgets/loading_products_sliver_grid_view.dart';
import '../../../core/widgets/products_sliver_grid_view.dart';
import '../../search/logic/search_cubit.dart';

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
              style: AppTextStyles.fontBlue23Bold,
            ),
            centerTitle: true,
            elevation: 0,
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  final searchCubit = SearchCubit(searchRepo: SearchRepo(
                      SearchWebServices(DioFactory.getDio())));
                  showSearch(context: context,
                      delegate: CustomSearchDelegate(searchCubit: searchCubit));
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
                itemCount: 6,
                itemBuilder: (context, index) {
                  return CategoryItem(model: CategoriesData.categoryList[index]);
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
                return LoadingProductsSliverGridView();
              }
              if (state is GetAllProductsLoadedSuccessfully) {
                return ProductsSliverGridView(models: state.products);
              }
              if (state is GetAllProductsFailed) {
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

          sliverVerticalSpacing(65),
        ],
      ),

      bottomNavigationBar: AppNavigationBar(activeIndex: 0),
    );
  }
}

