import 'package:dio/dio.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';

part 'details_web_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class DetailsWebServices {
  factory DetailsWebServices(Dio dio, {String? baseUrl}) = _DetailsWebServices;

  @GET(ApiConstants.productsDetails)
  Future<ProductModel> getProductDetails({
    @Path("id") required int id,
  });
}