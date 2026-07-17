import '../models/product_model.dart';
import '../web_services/home_web_services.dart';

class HomeRepo {
  final HomeWebServices webServices;

  HomeRepo(this.webServices);

  Future<List<ProductModel>> getAllProducts() async {
    var response = await webServices.getAllProducts();

    return response.results ?? [];
  }

  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  }) async {
    var response = await webServices.getProductsByCategory(category);

    return response.results ?? [];
  }
}
