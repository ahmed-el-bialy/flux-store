import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/shared_prefs_helper.dart';
import '../../home/data/models/product_model.dart';
import '../data/models/cart_item_model.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial()) {
    loadCart();
  }

  List<CartItemModel> _cartItems = [];

  List<CartItemModel> get cartItems => List.unmodifiable(_cartItems);

  int get totalItemsCount =>
      _cartItems.fold(0, (sum, item) => sum + item.quantity);

  double get subtotal =>
      _cartItems.fold(0.0, (sum, item) => sum + item.totalPrice);

  double get shippingFee => _cartItems.isEmpty ? 0.0 : 10.0;

  double get totalAmount => subtotal + shippingFee;

  void loadCart() {
    try {
      final rawList = SharedPrefsHelper.getCart();
      _cartItems = rawList.map((e) => CartItemModel.fromJson(e)).toList();
      emit(CartUpdated(items: _cartItems, totalAmount: totalAmount));
    } catch (_) {
      _cartItems = [];
      emit(CartUpdated(items: [], totalAmount: 0.0));
    }
  }

  void addToCart(ProductModel product, {int quantity = 1, String? size, String? color}) {
    final existingIndex = _cartItems.indexWhere(
      (item) => item.product.id == product.id && item.selectedSize == size,
    );

    if (existingIndex >= 0) {
      _cartItems[existingIndex].quantity += quantity;
    } else {
      _cartItems.add(
        CartItemModel(
          product: product,
          quantity: quantity,
          selectedSize: size,
          selectedColor: color,
        ),
      );
    }

    _persistAndEmit();
  }

  void updateQuantity(int productId, int delta) {
    final index = _cartItems.indexWhere((item) => item.product.id == productId);
    if (index >= 0) {
      _cartItems[index].quantity += delta;
      if (_cartItems[index].quantity <= 0) {
        _cartItems.removeAt(index);
      }
      _persistAndEmit();
    }
  }

  void removeFromCart(int productId) {
    _cartItems.removeWhere((item) => item.product.id == productId);
    _persistAndEmit();
  }

  void clearCart() {
    _cartItems.clear();
    _persistAndEmit();
  }

  void _persistAndEmit() {
    final jsonList = _cartItems.map((e) => e.toJson()).toList();
    SharedPrefsHelper.saveCart(jsonList);
    emit(CartUpdated(items: List.from(_cartItems), totalAmount: totalAmount));
  }
}
