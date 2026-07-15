import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/constants/app_constants.dart';
import 'package:flux_store/core/helper/routing_extension.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';

import '../theming/app_colors.dart';
import 'image_place_holder.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
      child: Card(
        elevation: 8,
        color: AppColors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.r),
        ),
        child: InkWell(
          onTap: () {
            context.pushNamed(AppConstants.detailsScreen, model.id);
          },
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: AppColors.white,
                elevation: .5,
                margin: EdgeInsets.all(6.w),
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12.r),
                      child: CachedNetworkImage(
                        imageUrl:
                            model.image ??
                            "https://imgs.search.brave.com/V2Opmlbzv_9kqjYLmk69cRg_ji1FXvO-CKjyCyFMaYI/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9pbWcu/bWFnbmlmaWMuY29t/L3ByZW1pdW0tdmVj/dG9yLzQwNC1wYWdl/LWZvdW5kLXNlYXJj/aC1lcnJvci13ZWIt/aWxsdXN0cmF0aW9u/XzU4NTAyNC00NTku/anBnP3NlbXQ9YWlz/X2h5YnJpZCZ3PTc0/MCZxPTgw",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => ImagePlaceHolder(),
                      ),
                    ),
                    Positioned(
                      top: 3.h,
                      right: 1.w,
                      child: Card(
                        elevation: 2,
                        clipBehavior: Clip.antiAlias,
                        shape: const CircleBorder(),
                        child: InkWell(
                          onTap: () {
                            /// TODO: implement favorite functionality
                          },
                          child: Padding(
                            padding: EdgeInsets.all(8.r),
                            child: Icon(
                              Icons.favorite_border_outlined,
                              size: 18.sp,
                              color: AppColors.blue,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 2.h,
                      left: 2.w,
                      child: Card(
                        elevation: .5,
                        color: AppColors.white.withValues(alpha: 0.9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 6.w,
                            vertical: 4.h,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                Icons.star,
                                color: AppColors.orange,
                                size: 14.sp,
                              ),
                              horizontalSpacing(2),
                              Text(
                                "${model.rate}",
                                style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              verticalSpacing(6),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: Text(
                    model.title,
                    style: AppTextStyles.fontBlack15Medium.copyWith(
                      fontSize: 15.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              verticalSpacing(4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$${model.price}",
                      style: AppTextStyles.fontBlue24Bold.copyWith(
                        fontSize: 16.sp,
                      ),
                    ),
                    Card(
                      elevation: 2,
                      clipBehavior: Clip.antiAlias,
                      shape: const CircleBorder(),
                      child: InkWell(
                        onTap: () {
                          /// TODO: implement add_to_cart functionality
                        },
                        child: Padding(
                          padding: EdgeInsets.all(8.r),
                          child: Icon(
                            Icons.add_shopping_cart,
                            size: 18.sp,
                            color: AppColors.blue,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
