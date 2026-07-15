import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class StockIndicator extends StatelessWidget {
  const StockIndicator({super.key, required this.stock});

  final int stock;

  @override
  Widget build(BuildContext context) {
    final isLowStock = stock > 0 && stock <= 5;
    final outOfStock = stock == 0;

    Color badgeColor = AppColors.blue.withValues(alpha: 0.1);
    Color textColor = AppColors.blue;
    String statusText = "$stock Items available in stock";

    if (outOfStock) {
      badgeColor = AppColors.redFavorite.withValues(alpha: 0.1);
      textColor = AppColors.redFavorite;
      statusText = "Out Of Stock";
    } else if (isLowStock) {
      badgeColor = AppColors.orange.withValues(alpha: 0.1);
      textColor = AppColors.orange;
      statusText = "Only $stock items left! Hurry up!";
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
      decoration: BoxDecoration(
        color: badgeColor,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            outOfStock ? Icons.gpp_bad_outlined : Icons.inventory_2_outlined,
            size: 16.sp,
            color: textColor,
          ),
          horizontalSpacing(8),
          Text(
            statusText,
            style: AppTextStyles.fontBlue11Bold.copyWith(color: textColor),
          ),
        ],
      ),
    );
  }
}
