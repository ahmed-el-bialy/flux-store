// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      results: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );


ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  image: json['thumbnail'] as String?,
  title: json['title'] as String,
  price: json['price'],
  rate: (json['rating'] as num).toDouble(),
  stock: (json['stock'] as num).toInt(),
  description: json['description'] as String,
  reviews: (json['reviews'] as List<dynamic>)
      .map((e) => ReviewsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'thumbnail': instance.image,
      'title': instance.title,
      'price': instance.price,
      'rating': instance.rate,
      'stock': instance.stock,
      'description': instance.description,
      'reviews': instance.reviews,
    };

ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) => ReviewsModel(
  rating: (json['rating'] as num).toInt(),
  comment: json['comment'] as String,
  date: json['date'] as String,
  reviewerName: json['reviewerName'] as String,
);

Map<String, dynamic> _$ReviewsModelToJson(ReviewsModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
      'reviewerName': instance.reviewerName,
    };
