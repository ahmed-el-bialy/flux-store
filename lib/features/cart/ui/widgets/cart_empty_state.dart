import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/routing_extension.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';

class CartEmptyState extends StatelessWidget {
  const CartEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 32.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24.r),
              decoration: BoxDecoration(
                color: AppColors.blue.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shopping_cart_outlined,
                size: 64.sp,
                color: AppColors.blue,
              ),
            ),
            verticalSpacing(24),
            Text(
              "Your Cart is Empty",
              style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 20.sp),
            ),
            verticalSpacing(8),
            Text(
              "Looks like you haven't added anything to your cart yet.",
              textAlign: TextAlign.center,
              style: AppTextStyles.fontGray14Regular.copyWith(
                color: AppColors.grayText.withValues(alpha: 0.8),
              ),
            ),
            verticalSpacing(28),
            AppTextButton(
              buttonText: "Discover Products",
              borderRadius: 25.r,
              textStyle: AppTextStyles.fontWhite16Bold,
              onPressed: () {
                context.pushReplacementNamed(RouteNames.home, null);
              },
            ),
          ],
        ),
      ),
    );
  }
}
