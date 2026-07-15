import 'package:flux_store/features/details/data/web_services/details_web_services.dart';

import '../../../home/data/models/product_model.dart';

class DetailsRepo {
  final DetailsWebServices webServices;

  DetailsRepo(this.webServices);

  Future<ProductModel> getProductsDetails({required int id}) async {
    var response = await webServices.getProductDetails(id: id);

    return response;
  }
}
