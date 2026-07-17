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

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{'products': instance.results};

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  description: json['description'] as String?,
  category: json['category'] as String?,
  price: json['price'] as num,
  discountPercentage: json['discountPercentage'] as num?,
  rate: json['rating'] as num,
  stock: (json['stock'] as num?)?.toInt(),
  brand: json['brand'] as String?,
  availabilityStatus: json['availabilityStatus'] as String?,
  reviews: (json['reviews'] as List<dynamic>?)
      ?.map((e) => ReviewsModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  images: (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
  image: json['thumbnail'] as String?,
);

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rate,
      'stock': instance.stock,
      'brand': instance.brand,
      'availabilityStatus': instance.availabilityStatus,
      'reviews': instance.reviews,
      'images': instance.images,
      'thumbnail': instance.image,
    };

ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) => ReviewsModel(
  rating: json['rating'] as num?,
  comment: json['comment'] as String?,
  date: json['date'] as String?,
  reviewerName: json['reviewerName'] as String?,
  reviewerEmail: json['reviewerEmail'] as String?,
);

Map<String, dynamic> _$ReviewsModelToJson(ReviewsModel instance) =>
    <String, dynamic>{
      'rating': instance.rating,
      'comment': instance.comment,
      'date': instance.date,
      'reviewerName': instance.reviewerName,
      'reviewerEmail': instance.reviewerEmail,
    };
