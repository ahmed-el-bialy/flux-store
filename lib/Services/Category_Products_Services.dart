import '../Constants/Constants.dart';
import '../Models/Product_Model.dart';
import '../helper/API.dart';

class CategoryProductsServices {
  Future<List<ProductModel>> getCategoriesProducts({
    required String category,
  }) async {
    Map<dynamic, dynamic> data = await Api().get(
      url: "$apiUrl/category/$category",
    );
    List<dynamic> products = data["products"];

    List<ProductModel> productList = [];

    for (var element in products) {
      ProductModel newProduct = ProductModel.fromJson(element);
      productList.add(newProduct);
    }
    return productList;
  }
}
