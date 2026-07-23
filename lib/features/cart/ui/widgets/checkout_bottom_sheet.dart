import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/routing_extension.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/routing/route_names.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../logic/cart_cubit.dart';

class CheckoutBottomSheet extends StatelessWidget {
  final CartCubit cartCubit;

  const CheckoutBottomSheet({super.key, required this.cartCubit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(24.r),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: AppColors.borderGray,
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
          ),
          verticalSpacing(16),
          Text(
            "Order Summary",
            style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 20.sp),
          ),
          verticalSpacing(16),
          Container(
            padding: EdgeInsets.all(16.r),
            decoration: BoxDecoration(
              color: AppColors.fieldBgGray,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Items (${cartCubit.totalItemsCount})", style: AppTextStyles.fontGray14Medium),
                    Text("\$${cartCubit.subtotal.toStringAsFixed(2)}", style: AppTextStyles.fontBlack14SemiBold),
                  ],
                ),
                verticalSpacing(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Delivery", style: AppTextStyles.fontGray14Medium),
                    Text("\$${cartCubit.shippingFee.toStringAsFixed(2)}", style: AppTextStyles.fontBlack14SemiBold),
                  ],
                ),
                const Divider(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Payable", style: AppTextStyles.fontBlack14SemiBold.copyWith(fontSize: 16.sp)),
                    Text("\$${cartCubit.totalAmount.toStringAsFixed(2)}", style: AppTextStyles.fontBlue23Bold.copyWith(fontSize: 18.sp)),
                  ],
                ),
              ],
            ),
          ),
          verticalSpacing(20),
          Text("Payment Method", style: AppTextStyles.fontBlack14SemiBold),
          verticalSpacing(10),
          ListTile(
            leading: Icon(Icons.credit_card_rounded, color: AppColors.blue, size: 28.sp),
            title: const Text("Credit / Debit Card"),
            trailing: const Icon(Icons.check_circle, color: AppColors.blue),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.r),
              side: const BorderSide(color: AppColors.blue, width: 1.5),
            ),
          ),
          verticalSpacing(24),
          AppTextButton(
            buttonText: "Confirm & Place Order",
            borderRadius: 25.r,
            textStyle: AppTextStyles.fontWhite16Bold,
            onPressed: () {
              Navigator.pop(context);
              cartCubit.clearCart();
              _showOrderSuccessDialog(context);
            },
          ),
          verticalSpacing(16),
        ],
      ),
    );
  }

  void _showOrderSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            verticalSpacing(10),
            Container(
              padding: EdgeInsets.all(16.r),
              decoration: const BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.check_rounded, color: Colors.white, size: 48.sp),
            ),
            verticalSpacing(16),
            Text(
              "Order Placed! 🎉",
              style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 22.sp),
            ),
            verticalSpacing(8),
            Text(
              "Thank you for shopping with Flux Store! Your order has been successfully confirmed.",
              textAlign: TextAlign.center,
              style: AppTextStyles.fontGray14Regular,
            ),
            verticalSpacing(24),
            AppTextButton(
              buttonText: "Continue Shopping",
              borderRadius: 25.r,
              onPressed: () {
                Navigator.pop(dialogContext);
                context.pushReplacementNamed(RouteNames.home, null);
              },
            ),
          ],
        ),
      ),
    );
  }
}
