import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/helper/routing_extension.dart';
import '../../../core/helper/spacing.dart';
import '../../../core/routing/route_names.dart';
import '../../../core/theming/app_colors.dart';
import '../../../core/theming/app_text_styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/image_place_holder.dart';
import '../../cart/logic/cart_cubit.dart';
import '../../home/data/models/product_model.dart';
import '../logic/wishlist_cubit.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new, size: 20.sp, color: AppColors.black),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "My Wishlist",
          style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 20.sp),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<WishlistCubit, WishlistState>(
        builder: (context, state) {
          final wishlistCubit = context.watch<WishlistCubit>();
          final items = wishlistCubit.wishlistItems;

          if (items.isEmpty) {
            return _buildEmptyState(context);
          }

          return ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
            itemCount: items.length,
            separatorBuilder: (context, index) => verticalSpacing(12),
            itemBuilder: (context, index) {
              final product = items[index];
              return _buildWishlistItem(context, product);
            },
          );
        },
      ),
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
                color: AppColors.redFavorite.withValues(alpha: 0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border_rounded,
                size: 64.sp,
                color: AppColors.redFavorite,
              ),
            ),
            verticalSpacing(24),
            Text(
              "Your Wishlist is Empty",
              style: AppTextStyles.fontBlack24Bold.copyWith(fontSize: 20.sp),
            ),
            verticalSpacing(8),
            Text(
              "Explore products and save your favorite items so you can easily find them later.",
              textAlign: TextAlign.center,
              style: AppTextStyles.fontGray14Regular.copyWith(
                color: AppColors.grayText.withValues(alpha: 0.8),
                height: 1.4,
              ),
            ),
            verticalSpacing(28),
            AppTextButton(
              buttonText: "Explore Products",
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

  Widget _buildWishlistItem(BuildContext context, ProductModel product) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.fieldBgGray,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16.r),
        onTap: () {
          if (product.id != null) {
            context.pushNamed(RouteNames.details, product.id);
          }
        },
        child: Padding(
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
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    verticalSpacing(6),
                    Text(
                      "\$${product.price}",
                      style: AppTextStyles.fontBlue23Bold.copyWith(fontSize: 16.sp),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                    icon: Icon(Icons.favorite, color: AppColors.redFavorite, size: 22.sp),
                    onPressed: () {
                      context.read<WishlistCubit>().toggleFavorite(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Removed from Wishlist"),
                          duration: Duration(seconds: 1),
                        ),
                      );
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.add_shopping_cart, color: AppColors.blue, size: 20.sp),
                    onPressed: () {
                      context.read<CartCubit>().addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${product.title} added to Cart!"),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
