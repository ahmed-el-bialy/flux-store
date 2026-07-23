import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/widgets/app_text_form_field.dart';
import 'package:flux_store/features/categories/data/local/categories_data.dart';
import 'package:flux_store/features/main_layout/ui/main_layout_screen.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../widgets/categories_grid_view.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List filteredCategories = List.from(CategoriesData.categoryList);

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
            floating: true,
            leading: IconButton(
              onPressed: () {
                MainLayoutScreen.switchTab(context, 0);
              },
              icon: const Icon(Icons.arrow_back_rounded),
            ),
          ),

          sliverVerticalSpacing(15),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Text(
                "Explore Categories",
                style: AppTextStyles.fontBlack18SimiBold,
              ),
            ),
          ),

          sliverVerticalSpacing(15),

          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: AppTextFormField(
                hintText: "Search for category",
                prefixIcon: Icon(
                  Icons.search,
                  size: 24.sp,
                  color: AppColors.grayText,
                ),
                onChanged: (value) {
                  setState(() {
                    if (value == null && value!.isEmpty) {
                      filteredCategories = List.from(
                        CategoriesData.categoryList,
                      );
                    } else {
                      filteredCategories = CategoriesData.categoryList
                          .where(
                            (category) => category.name.toLowerCase().contains(
                              value.toLowerCase(),
                            ),
                          )
                          .toList();
                    }
                  });
                  return null;
                },
              ),
            ),
          ),

          sliverVerticalSpacing(15),

          filteredCategories.isEmpty
              ? const SliverToBoxAdapter(
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 40.0),
                      child: Text(
                        "No categories found!",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                )
              : CategoriesGridView(filteredCategories: filteredCategories),

          sliverVerticalSpacing(70),
        ],
      ),
    );
  }
}
