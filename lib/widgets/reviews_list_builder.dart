import 'package:flutter/material.dart';
import 'package:flux_store/models/product_model.dart';
import 'review_card_widget.dart';

class ReviewsListBuilder extends StatelessWidget {
  const ReviewsListBuilder({super.key, required this.reviews});

  final List<ReviewsModel> reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
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
