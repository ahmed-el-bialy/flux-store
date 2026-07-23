part of 'wishlist_cubit.dart';

@immutable
sealed class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistUpdated extends WishlistState {
  final List<ProductModel> items;

  WishlistUpdated({required this.items});
}
