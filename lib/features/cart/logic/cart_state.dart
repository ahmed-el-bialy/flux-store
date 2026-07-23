part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

class CartInitial extends CartState {}

class CartUpdated extends CartState {
  final List<CartItemModel> items;
  final double totalAmount;

  CartUpdated({required this.items, required this.totalAmount});
}
