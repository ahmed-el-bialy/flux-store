import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/image_place_holder.dart';
import '../../../home/data/models/product_model.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final imageUrl = (product.images != null && product.images!.isNotEmpty)
        ? product.images!.first
        : (product.image ?? '');

    final hasDiscount =
        product.discountPercentage != null && product.discountPercentage! > 0;

    return Container(
      height: 390.h,
      width: double.infinity,
      decoration: const BoxDecoration(color: AppColors.white),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Container(
              margin: EdgeInsets.all(12.r),
              decoration: BoxDecoration(
                color: AppColors.lightBlue.withValues(alpha: 0.3),
                borderRadius: BorderRadius.circular(24.r),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(40.r),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              placeholder: (context, url) => ImagePlaceHolder(h: 200.h),
              errorWidget: (context, url, error) => const Icon(
                Icons.image_not_supported_outlined,
                color: AppColors.blue,
                size: 40,
              ),
            ),
          ),
          if (hasDiscount)
            Positioned(
              top: MediaQuery.of(context).padding.top + 70.h,
              left: 28.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.redFavorite,
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Text(
                  "${product.discountPercentage!.toStringAsFixed(0)}% OFF",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
