import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helper/spacing.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import '../../../../core/widgets/image_place_holder.dart';
import '../../data/models/cart_item_model.dart';
import '../../logic/cart_cubit.dart';

class CartItemCard extends StatelessWidget {
  final CartItemModel item;

  const CartItemCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
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
}
