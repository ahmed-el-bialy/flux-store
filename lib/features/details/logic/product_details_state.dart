part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

final class ProductDetailsInitial extends ProductDetailsState {}

final class ProductDetailsLoading extends ProductDetailsState {}

final class ProductDetailsLoadedSuccessfully extends ProductDetailsState {
  final ProductModel product;

  ProductDetailsLoadedSuccessfully({required this.product});
}

final class ProductDetailsFailed extends ProductDetailsState {
  final String errorMessage;

  ProductDetailsFailed({required this.errorMessage});
}
