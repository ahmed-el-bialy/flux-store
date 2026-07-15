import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/core/helper/spacing.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_text_styles.dart';

class ReviewItem extends StatelessWidget {
  const ReviewItem({
    super.key,
    required this.name,
    required this.comment,
    required this.rating,
  });

  final String name;
  final String comment;
  final int rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.reviewCardBg,
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 16.r,
                    backgroundColor: AppColors.lightBlue,
                    child: Text(
                      name.isNotEmpty
                          ? name.substring(0, 1).toUpperCase()
                          : "U",
                      style: AppTextStyles.fontBlue14Medium.copyWith(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  horizontalSpacing(8),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: AppTextStyles.fontBlack15Medium.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Verified Purchaser",
                        style: AppTextStyles.fontGray14Regular.copyWith(
                          fontSize: 10.sp,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    size: 14.sp,
                    color: index < rating
                        ? AppColors.orange
                        : AppColors.shimmerBase,
                  );
                }),
              ),
            ],
          ),
          verticalSpacing(10),
          Text(
            comment,
            style: AppTextStyles.fontBlack15Medium.copyWith(
              fontSize: 12.sp,
              color: AppColors.black.withValues(alpha: 0.8),
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
