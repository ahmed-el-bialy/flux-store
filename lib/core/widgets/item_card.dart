import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';
import 'package:flux_store/core/theming/app_text_styles.dart';

import '../theming/app_colors.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6.h, horizontal: 4.w),
      child: Card(
        elevation: 8,
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://cdn.mos.cms.futurecdn.net/GXHa4PWwDPx7tGQG9MDQvK-650-80.jpg.webp",
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
                Align(alignment: Alignment.topLeft, child: Text("4.5")),
              ],
            ),

            verticalSpacing(5),

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text("Camera", style: AppTextStyles.fontBlack15Medium),
              ),
            ),
            verticalSpacing(5),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                spacing: 0,
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      "200.0",
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
    );
  }
}
