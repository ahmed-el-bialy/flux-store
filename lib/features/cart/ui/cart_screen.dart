import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/routing_extension.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/routing/route_names.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/app_navigation_bar.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/image_place_holder.dart';
import '../data/models/cart_item_model.dart';
import '../logic/cart_cubit.dart';

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
              ? _buildEmptyState(context)
              : Column(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                        itemCount: items.length,
                        separatorBuilder: (context, index) => verticalSpacing(12),
                        itemBuilder: (context, index) {
                          final item = items[index];
                          return _buildCartItemCard(context, item);
                        },
                      ),
                    ),
                    _buildCartSummary(context, cartCubit),
                  ],
                ),
          bottomNavigationBar: const AppNavigationBar(activeIndex: 2),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
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

  Widget _buildCartItemCard(BuildContext context, CartItemModel item) {
    final product = item.product;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldBgGray,
        borderRadius: BorderRadius.circular(16.r),
      ),
      padding: EdgeInsets.all(12.r),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: SizedBox(
              width: 75.w,
              height: 75.h,
              child: CachedNetworkImage(
                imageUrl: product.image ?? '',
                fit: BoxFit.cover,
                placeholder: (context, url) => const ImagePlaceHolder(),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade200,
                  child: Icon(Icons.shopping_bag_outlined, color: AppColors.grayText, size: 28.sp),
                ),
              ),
            ),
          ),
          horizontalSpacing(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.title,
                  style: AppTextStyles.fontBlack14SemiBold,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                verticalSpacing(4),
                Text(
                  "\$${product.price} each",
                  style: AppTextStyles.fontGray14Regular.copyWith(fontSize: 12.sp),
                ),
                verticalSpacing(6),
                Text(
                  "\$${item.totalPrice.toStringAsFixed(2)}",
                  style: AppTextStyles.fontBlue23Bold.copyWith(fontSize: 16.sp),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: Icon(Icons.close, color: AppColors.grayText, size: 18.sp),
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                onPressed: () {
                  if (product.id != null) {
                    context.read<CartCubit>().removeFromCart(product.id!);
                  }
                },
              ),
              verticalSpacing(8),
              Container(
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AppColors.borderGray),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: () {
                        if (product.id != null) {
                          context.read<CartCubit>().updateQuantity(product.id!, -1);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(6.r),
                        child: Icon(Icons.remove, size: 16.sp, color: AppColors.black),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: Text(
                        "${item.quantity}",
                        style: AppTextStyles.fontBlack14SemiBold,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        if (product.id != null) {
                          context.read<CartCubit>().updateQuantity(product.id!, 1);
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.all(6.r),
                        child: Icon(Icons.add, size: 16.sp, color: AppColors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary(BuildContext context, CartCubit cartCubit) {
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
            onPressed: () => _showCheckoutDialog(context, cartCubit),
          ),
        ],
      ),
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
      builder: (sheetContext) => Padding(
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
                Navigator.pop(sheetContext);
                cartCubit.clearCart();
                _showOrderSuccessDialog(context);
              },
            ),
            verticalSpacing(16),
          ],
        ),
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
