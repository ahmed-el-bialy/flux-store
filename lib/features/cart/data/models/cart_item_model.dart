import 'package:flux_store/features/home/data/models/product_model.dart';

class CartItemModel {
  final ProductModel product;
  int quantity;
  final String? selectedSize;
  final String? selectedColor;

  CartItemModel({
    required this.product,
    this.quantity = 1,
    this.selectedSize,
    this.selectedColor,
  });

  double get totalPrice => (product.price * quantity).toDouble();

  Map<String, dynamic> toJson() => {
        'product': product.toJson(),
        'quantity': quantity,
        'selectedSize': selectedSize,
        'selectedColor': selectedColor,
      };

  factory CartItemModel.fromJson(Map<String, dynamic> json) => CartItemModel(
        product: ProductModel.fromJson(Map<String, dynamic>.from(json['product'] as Map)),
        quantity: json['quantity'] as int? ?? 1,
        selectedSize: json['selectedSize'] as String?,
        selectedColor: json['selectedColor'] as String?,
      );
}
