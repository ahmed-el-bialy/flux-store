import 'package:flux_store/data/models/category_model.dart';

import '../models/product_model.dart';
import '../web_services/web_services.dart';

class Repo {
  final WebServices webServices;

  Repo(this.webServices);

  Future<List<ProductModel>> getAllProducts() async {
    var response = await webServices.getAllProducts();

    return response.results ?? [];
  }

  Future<List<CategoryModel>> getAllCategories() async {
    var response = await webServices.getAllCategories();

    return response;
  }

  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  }) async {
    var response = await webServices.getProductsByCategory(category);

    return response.results ?? [];
  }
}
