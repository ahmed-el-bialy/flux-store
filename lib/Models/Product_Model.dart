class ProductModel {
  final String image;
  final String title;
  final dynamic price;
  final double rate;
  final int stock;
  final String description;
  final List<ReviewsModel> reviews;
  bool isFav;

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.rate,
    required this.stock,
    required this.description,
    this.isFav = false,
    required this.reviews,
  });

  factory ProductModel.fromJson(jsonData) {
    List<dynamic> rawReviews = jsonData["reviews"];
    List<ReviewsModel> reviewsList = rawReviews
        .map((eachReview) => ReviewsModel.fromJson(eachReview))
        .toList();
    return ProductModel(
      image: jsonData["thumbnail"],
      title: jsonData["title"],
      price: jsonData["price"],
      rate: jsonData['rating'],
      stock: jsonData["stock"],
      description: jsonData["description"],
      reviews: reviewsList,
    );
  }
}

class ReviewsModel {
  final int rating;
  final String comment;
  final String date;
  final String reviewerName;

  ReviewsModel({
    required this.rating,
    required this.comment,
    required this.date,
    required this.reviewerName,
  });

  factory ReviewsModel.fromJson(jsonData) {
    return ReviewsModel(
      rating: jsonData["rating"]?? "?",
      comment: jsonData["comment"]??"not Found",
      date: jsonData["date"]??"?",
      reviewerName: jsonData["reviewerName"]??"unknown",
    );
  }
}
