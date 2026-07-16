import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/helper/routing_extension.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/widgets/app_navigation_bar.dart';
import 'package:flux_store/core/widgets/app_text_form_field.dart';
import 'package:flux_store/features/home/data/local/categories_data.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

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
                context.pop();
              },
              icon: Icon(Icons.arrow_back_rounded),
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
              ),
            ),
          ),

          sliverVerticalSpacing(15),

          SliverGrid.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: CategoriesData.categoryList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
                child: Card(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.r),
                    splashColor: AppColors.blue.withValues(alpha: .2),
                    onTap: () {
                      context.pushNamed(
                        AppConstants.categoryProductsScreen,
                        CategoriesData.categoryList[index].name.toLowerCase(),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          CategoriesData.categoryList[index].image,
                          height: 50.h,
                        ),

                        verticalSpacing(10),

                        Text(
                          CategoriesData.categoryList[index].name,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.fontBlack14SemiBold,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),

          sliverVerticalSpacing(70),
        ],
      ),
      bottomNavigationBar: AppNavigationBar(activeIndex: 1),
    );
  }
}
