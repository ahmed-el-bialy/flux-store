import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';
import 'package:shimmer/shimmer.dart';

import '../theming/app_colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key, required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
      child: GestureDetector(
        onTap: () {
          /// TODO implement product view
        },
        child: Card(
          elevation: 8,
          color: AppColors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Card(
                color: AppColors.white,
                elevation: .5,
                child: Stack(
                  fit: StackFit.passthrough,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: CachedNetworkImage(
                        imageUrl:
                            model.image ??
                            "https://imgs.search.brave.com/V2Opmlbzv_9kqjYLmk69cRg_ji1FXvO-CKjyCyFMaYI/rs:fit:500:0:1:0/g:ce/aHR0cHM6Ly9pbWcu/bWFnbmlmaWMuY29t/L3ByZW1pdW0tdmVj/dG9yLzQwNC1wYWdl/LWZvdW5kLXNlYXJj/aC1lcnJvci13ZWIt/aWxsdXN0cmF0aW9u/XzU4NTAyNC00NTku/anBnP3NlbXQ9YWlz/X2h5YnJpZCZ3PTc0/MCZxPTgw",
                        fit: BoxFit.cover,
                        placeholder: (context, url) => SizedBox(
                          height: 135.h,
                          child: Center(
                            child: Shimmer.fromColors(
                              baseColor: AppColors.black.withValues(alpha: 0.6),

                              highlightColor: AppColors.blue.withValues(
                                alpha: .4,
                              ),

                              child: Text(
                                'Loading ...',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () {
                          ///TODO: implement favorite functionality
                        },
                        icon: Icon(Icons.favorite),
                      ),
                    ),

                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 8.h,
                          horizontal: 8.w,
                        ),
                        child: Text("${model.rate}"),
                      ),
                    ),
                  ],
                ),
              ),

              verticalSpacing(10),

              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    model.title,
                    style: AppTextStyles.fontBlack15Medium.copyWith(
                      fontSize: 17.sp,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              verticalSpacing(4),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 0,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Text(
                        "${model.price}",
                        style: AppTextStyles.fontBlue24Bold.copyWith(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),

                    IconButton(
                      onPressed: () {
                        ///TODO: implement cart functionality
                      },
                      icon: Icon(Icons.add_shopping_cart, size: 20.sp),
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
