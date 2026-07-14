part of 'get_all_products_cubit.dart';

@immutable
sealed class GetAllProductsState {}

final class GetAllProductsInitial extends GetAllProductsState {}

final class GetAllProductsLoading extends GetAllProductsState {}

final class GetAllProductsLoadedSuccessfully extends GetAllProductsState {
  final List<ProductModel> products;

  GetAllProductsLoadedSuccessfully({required this.products});
}

final class GetAllProductsFailed extends GetAllProductsState {
  final String errorMessage;

  GetAllProductsFailed({required this.errorMessage});
}
