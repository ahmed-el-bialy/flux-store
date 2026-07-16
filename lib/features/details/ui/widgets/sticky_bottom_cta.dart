import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class StickyBottomCTA extends StatelessWidget {
  const StickyBottomCTA({super.key, required this.stock});

  final int stock;

  @override
  Widget build(BuildContext context) {
    final outOfStock = stock == 0;

    return Container(
      height: 64.h + MediaQuery.of(context).padding.bottom,
      padding: EdgeInsets.only(
        left: 24.w,
        right: 24.w,
        bottom: MediaQuery.of(context).padding.bottom + 8.h,
        top: 8.h,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.02),
            blurRadius: 10.r,
            offset: const Offset(0, -4),
          ),
        ],
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: SizedBox(
              height: 48.h,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: outOfStock
                      ? AppColors.disabledBg
                      : AppColors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(24.r),
                  ),
                  elevation: 0,
                ),
                onPressed: outOfStock
                    ? null
                    : () {
                        // TODO implement add to cart
                      },
                child: Text(
                  outOfStock ? "OUT OF STOCK" : "ADD TO CART",
                  style: AppTextStyles.fontWhite16Bold.copyWith(
                    color: outOfStock
                        ? AppColors.disabledText
                        : AppColors.white,
                    letterSpacing: 1.0,
                    fontSize: 14.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
