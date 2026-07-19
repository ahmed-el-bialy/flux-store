import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/routing_extension.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/routing/route_names.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class CategoriesGridView extends StatelessWidget {
  const CategoriesGridView({super.key, required this.filteredCategories});

  final List<dynamic> filteredCategories;

  @override
  Widget build(BuildContext context) {
    return SliverGrid.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemCount: filteredCategories.length,
      itemBuilder: (context, index) {
        final category = filteredCategories[index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 5.w),
          child: Card(
            child: InkWell(
              borderRadius: BorderRadius.circular(12.r),
              splashColor: AppColors.blue.withValues(alpha: .2),
              onTap: () {
                context.pushNamed(
                  RouteNames.categoryProducts,
                  category.name.toLowerCase(),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(category.image, height: 50.h),
                  verticalSpacing(10),
                  Text(
                    category.name,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyles.fontBlack14SemiBold,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
