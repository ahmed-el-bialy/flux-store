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
  @JsonKey(name: "id")
  final int? id;

  @JsonKey(name: "title")
  final String title;

  @JsonKey(name: "description")
  final String? description;

  @JsonKey(name: "category")
  final String? category;

  @JsonKey(name: "price")
  final num price;

  @JsonKey(name: "discountPercentage")
  final num? discountPercentage;

  @JsonKey(name: "rating")
  final num rate;

  @JsonKey(name: "stock")
  final int? stock;

  @JsonKey(name: "brand")
  final String? brand;

  @JsonKey(name: "availabilityStatus")
  final String? availabilityStatus;

  @JsonKey(name: "reviews")
  final List<ReviewsModel>? reviews;

  @JsonKey(name: "images")
  final List<String>? images;

  @JsonKey(name: "thumbnail")
  final String? image;

  ProductModel({
    this.id,
    required this.title,
    this.description,
    this.category,
    required this.price,
    this.discountPercentage,
    required this.rate,
    this.stock,
    this.brand,
    this.availabilityStatus,
    this.reviews,
    this.images,
    required this.image,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);
}

@JsonSerializable()
class ReviewsModel {
  @JsonKey(name: "rating")
  final num? rating;

  @JsonKey(name: "comment")
  final String? comment;

  @JsonKey(name: "date")
  final String? date;

  @JsonKey(name: "reviewerName")
  final String? reviewerName;

  @JsonKey(name: "reviewerEmail")
  final String? reviewerEmail;

  ReviewsModel({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory ReviewsModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewsModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewsModelToJson(this);
}
