
import 'package:flutter/material.dart';

import '../Models/Product_Model.dart';
import '../helper/Data_Formater.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget({
    super.key,
    required this.reviews,
  });

  final ReviewsModel reviews;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 80,
        child: Card(
          child: Stack(
            children: [
              Align(
                alignment: AlignmentGeometry.topLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(reviews.reviewerName,style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.topRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(dateFormater(reviews.date), style: TextStyle(fontSize: 14)),
                ),
              ), Align(
                alignment: AlignmentGeometry.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${reviews.rating}⭐", style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold)),
                ),
              ),
              Align(
                alignment: AlignmentGeometry.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 12,
                  ),
                  child: Text(reviews.comment, style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
