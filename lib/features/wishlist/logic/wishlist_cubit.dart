import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/helper/shared_prefs_helper.dart';
import '../../home/data/models/product_model.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial()) {
    loadWishlist();
  }

  List<ProductModel> _wishlistItems = [];

  List<ProductModel> get wishlistItems => List.unmodifiable(_wishlistItems);

  void loadWishlist() {
    try {
      final rawList = SharedPrefsHelper.getWishlist();
      _wishlistItems = rawList.map((e) => ProductModel.fromJson(e)).toList();
      emit(WishlistUpdated(items: _wishlistItems));
    } catch (_) {
      _wishlistItems = [];
      emit(WishlistUpdated(items: []));
    }
  }

  bool isFavorite(int? productId) {
    if (productId == null) return false;
    return _wishlistItems.any((item) => item.id == productId);
  }

  void toggleFavorite(ProductModel product) {
    if (product.id == null) return;

    final index = _wishlistItems.indexWhere((item) => item.id == product.id);
    if (index >= 0) {
      _wishlistItems.removeAt(index);
    } else {
      _wishlistItems.add(product);
    }

    _persistAndEmit();
  }

  void removeFromWishlist(int productId) {
    _wishlistItems.removeWhere((item) => item.id == productId);
    _persistAndEmit();
  }

  void _persistAndEmit() {
    final jsonList = _wishlistItems.map((e) => e.toJson()).toList();
    SharedPrefsHelper.saveWishlist(jsonList);
    emit(WishlistUpdated(items: List.from(_wishlistItems)));
  }
}
