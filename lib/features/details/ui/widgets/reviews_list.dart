import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';

import 'review_item.dart';

class ReviewsList extends StatelessWidget {
  const ReviewsList({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: product.reviews!.length,
      itemBuilder: (context, index) {
        final review = product.reviews![index];
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 6.h),
          child: ReviewItem(
            name: review.reviewerName ?? "Anonymous User",
            comment: review.comment ?? "No comment provided.",
            rating: review.rating?.toInt() ?? 5,
          ),
        );
      },
    );
  }
}
