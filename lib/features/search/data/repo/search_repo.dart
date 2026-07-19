import 'package:flux_store/features/search/data/web_services/search_web_services.dart';

import '../../../home/data/models/product_model.dart';

class SearchRepo {
  final SearchWebServices webServices;

  SearchRepo(this.webServices);

  Future<List<ProductModel>> search({required String query}) async {
    var response = await webServices.searchForProduct(query);

    return response.results ?? [];
  }
}
