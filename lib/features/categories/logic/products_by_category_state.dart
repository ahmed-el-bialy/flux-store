part of 'products_by_category_cubit.dart';

@immutable
sealed class ProductsByCategoryState {}

final class ProductsByCategoryInitial extends ProductsByCategoryState {}

final class ProductsByCategoryLoading extends ProductsByCategoryState {}

final class ProductsByCategorySuccess extends ProductsByCategoryState {
  final List<ProductModel> products;

  ProductsByCategorySuccess({required this.products});
}

final class ProductsByCategoryFailed extends ProductsByCategoryState {
  final String errorMessage;

  ProductsByCategoryFailed({required this.errorMessage});
}
