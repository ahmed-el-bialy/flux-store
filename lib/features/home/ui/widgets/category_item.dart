import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/helper/routing_extension.dart';

import '../../../../core/helper/spacing.dart';
import '../../../categories/data/models/off_line_category_model.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.model});

  final OffLineCategoryModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
      child: GestureDetector(
        onTap: () {
          context.pushNamed(
            AppConstants.categoryProductsScreen,
            model.name.toLowerCase(),
          );
        },
        child: SizedBox(
          width: 65.w,
          child: Column(
            children: [
              Image.asset(model.image, height: 50.h),
              verticalSpacing(5),
              Text(model.name, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
    );
  }
}
