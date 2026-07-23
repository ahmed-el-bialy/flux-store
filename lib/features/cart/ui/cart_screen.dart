import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/app_navigation_bar.dart';
import '../logic/cart_cubit.dart';
import 'widgets/cart_empty_state.dart';
import 'widgets/cart_item_card.dart';
import 'widgets/cart_summary.dart';
import 'widgets/checkout_bottom_sheet.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        final cartCubit = context.watch<CartCubit>();
        final items = cartCubit.cartItems;

        return Scaffold(
          backgroundColor: AppColors.white,
          appBar: AppBar(
            backgroundColor: AppColors.white,
            elevation: 0,
            title: Text(
              "My Cart (${cartCubit.totalItemsCount})",
              style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 20.sp),
            ),
            centerTitle: true,
            actions: [
              if (items.isNotEmpty)
                IconButton(
                  icon: Icon(Icons.delete_sweep_outlined, color: AppColors.redError, size: 24.sp),
                  onPressed: () => _showClearCartDialog(context),
                ),
            ],
          ),
          body: items.isEmpty
              ? const CartEmptyState()
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        itemCount: items.length,
                        separatorBuilder: (context, index) => verticalSpacing(12),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return CartItemCard(item: item);
                        },
                      ),
                    ),
                    CartSummary(
                      cartCubit: cartCubit,
                      onCheckout: () => _showCheckoutDialog(context, cartCubit),
                    ),
                  ],
                ),
        );
      },
    );
  }

  void _showClearCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (dialogContext) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        title: const Text("Clear Cart"),
        content: const Text("Are you sure you want to remove all items from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text("Cancel", style: AppTextStyles.fontGray14Medium),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(dialogContext);
              context.read<CartCubit>().clearCart();
            },
            child: Text("Clear All", style: TextStyle(color: AppColors.redError, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  void _showCheckoutDialog(BuildContext context, CartCubit cartCubit) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24.r)),
      ),
      builder: (sheetContext) => CheckoutBottomSheet(cartCubit: cartCubit),
    );
  }
}
