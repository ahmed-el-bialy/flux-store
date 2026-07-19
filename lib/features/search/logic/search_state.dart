part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

final class SearchLoading extends SearchState {}

final class SearchSuccess extends SearchState {
  final List<ProductModel> products;

  SearchSuccess({required this.products});
}

final class SearchFailed extends SearchState {
  final String errorMessage;

  SearchFailed({required this.errorMessage});
}
