import 'package:flux_store/models/product_model.dart';
import '../core/constants/constants.dart';
import '../core/helper/API.dart';

class AllProductsServices {
  Future<List<ProductModel>> getAllProducts() async {
    Map<dynamic, dynamic> data = await Api().get(url: apiUrl);
    List<dynamic> products = data["products"];

    List<ProductModel> productList = [];

    for (var element in products) {
      ProductModel newProduct = ProductModel.fromJson(element);
      productList.add(newProduct);
    }
    return productList;
  }
}
