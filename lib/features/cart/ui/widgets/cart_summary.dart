import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../logic/cart_cubit.dart';

class CartSummary extends StatelessWidget {
  final CartCubit cartCubit;
  final VoidCallback onCheckout;

  const CartSummary({super.key, required this.cartCubit, required this.onCheckout});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.r),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Subtotal", style: AppTextStyles.fontGray14Medium),
              Text("\$${cartCubit.subtotal.toStringAsFixed(2)}", style: AppTextStyles.fontBlack14SemiBold),
            ],
          ),
          verticalSpacing(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Estimated Shipping", style: AppTextStyles.fontGray14Medium),
              Text(
                cartCubit.shippingFee == 0 ? "FREE" : "\$${cartCubit.shippingFee.toStringAsFixed(2)}",
                style: AppTextStyles.fontBlack14SemiBold.copyWith(
                  color: cartCubit.shippingFee == 0 ? Colors.green : AppColors.black,
                ),
              ),
            ],
          ),
          verticalSpacing(8),
          const Divider(),
          verticalSpacing(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Total Amount", style: AppTextStyles.fontBlack18SimiBold.copyWith(fontSize: 18.sp)),
              Text(
                "\$${cartCubit.totalAmount.toStringAsFixed(2)}",
                style: AppTextStyles.fontBlue23Bold.copyWith(fontSize: 20.sp),
              ),
            ],
          ),
          verticalSpacing(16),
          AppTextButton(
            buttonText: "Checkout (${cartCubit.totalItemsCount} items)",
            borderRadius: 25.r,
            textStyle: AppTextStyles.fontWhite16Bold,
            onPressed: onCheckout,
          ),
        ],
      ),
    );
  }
}
