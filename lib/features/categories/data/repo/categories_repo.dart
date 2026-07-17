import 'package:flux_store/features/categories/data/web_services/categories_web_services.dart';

import '../../../home/data/models/product_model.dart';

class CategoriesRepo {
  final CategoriesWebServices webServices;

  CategoriesRepo(this.webServices);

  Future<List<ProductModel>> getProductsByCategory({
    required String category,
  }) async {
    var response = await webServices.getProductsByCategory(category);

    return response.results ?? [];
  }
}
