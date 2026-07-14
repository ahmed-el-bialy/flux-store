import 'package:json_annotation/json_annotation.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductResponse {
  @JsonKey(name: "products")
  final List<ProductModel>? results;

  ProductResponse({this.results});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);
}

@JsonSerializable()
class ProductModel {
  @JsonKey(name: "thumbnail")
  final String image;
  @JsonKey(name: "title")
  final String title;
  @JsonKey(name: "price")
  final dynamic price;
  @JsonKey(name: "rating")
  final double rate;
  @JsonKey(name: "stock")
  final int stock;
  @JsonKey(name: "description")
  final String description;
  @JsonKey(name: "reviews")
  final List<ReviewsModel> reviews;

  ProductModel({
    required this.image,
    required this.title,
    required this.price,
    required this.rate,
    required this.stock,
    required this.description,
    required this.reviews,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
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

  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsModelToJson(this);
}
