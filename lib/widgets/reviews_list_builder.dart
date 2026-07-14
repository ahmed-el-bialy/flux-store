import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../features/home/data/models/product_model.dart';
import 'review_card_widget.dart';

class ReviewsListBuilder extends StatelessWidget {
  const ReviewsListBuilder({super.key, required this.reviews});

  final List<ReviewsModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8.0.r),
      child: ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemCount: reviews.length,
        itemBuilder: (context, index) {
          return ReviewCardWidget(reviews: reviews[index]);
        },
      ),
    );
  }
}
