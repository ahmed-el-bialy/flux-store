import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/features/details/ui/widgets/product_image.dart';
import 'package:flux_store/features/details/ui/widgets/stock_indicator.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';
import 'reviews_list.dart';

class ScreenBody extends StatelessWidget {
  const ScreenBody({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final price = product.price;
    final discount = product.discountPercentage ?? 0;
    final hasDiscount = discount > 0;

    final originalPrice = hasDiscount
        ? (price / (1 - (discount / 100)))
        : price;

    final stockCount = product.stock ?? 0;

    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverAppBar(
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          pinned: false,
          floating: true,
          snap: true,
          automaticallyImplyLeading: true,
          actions: [
            Container(
              margin: EdgeInsets.only(right: 16.w),
              decoration: BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.15),
                    blurRadius: 10.r,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                icon: Icon(
                  Icons.favorite_border_outlined,
                  color: AppColors.blue,
                  size: 18.sp,
                ),
                onPressed: () {
                  /// TODO Implement favorite
                },
              ),
            ),
          ],
        ),

        SliverToBoxAdapter(child: ProductImage(product: product)),

        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      (product.category ?? "PERFORMANCE SERIES").toUpperCase(),
                      style: AppTextStyles.fontBlue11Bold.copyWith(
                        letterSpacing: 1.2,
                      ),
                    ),
                    Row(
                      children: [
                        Icon(Icons.star, color: AppColors.orange, size: 16.sp),
                        horizontalSpacing(4),
                        Text(
                          "${product.rate}",
                          style: AppTextStyles.fontBlack15Medium.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                verticalSpacing(6),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        product.title,
                        style: AppTextStyles.fontBlack24Bold,
                      ),
                    ),
                    horizontalSpacing(16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "\$${price.toStringAsFixed(2)}",
                          style: AppTextStyles.fontBlue24Bold,
                        ),
                        if (hasDiscount) ...[
                          verticalSpacing(2),
                          Text(
                            "\$${originalPrice.toStringAsFixed(2)}",
                            style: AppTextStyles.fontGray14Regular.copyWith(
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ],
                ),
                verticalSpacing(16),
                StockIndicator(stock: stockCount),

                verticalSpacing(20),
                Text(
                  product.description ?? "No description available.",
                  style: AppTextStyles.fontGray14Regular.copyWith(height: 1.5),
                ),
                verticalSpacing(24),

                Text(
                  "Reviews (${product.reviews?.length ?? 0})",
                  style: AppTextStyles.fontBlack18SimiBold,
                ),

                verticalSpacing(5),

                if (product.reviews != null && product.reviews!.isNotEmpty)
                  ReviewsList(product: product)
                else
                  Text(
                    "No reviews yet.",
                    style: AppTextStyles.fontGray14Regular,
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
