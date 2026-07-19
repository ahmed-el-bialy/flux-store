import 'package:dio/dio.dart';
import 'package:flux_store/core/constants/api_constants.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'home_web_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeWebServices {
  factory HomeWebServices(Dio dio, {String? baseUrl}) = _HomeWebServices;

  @GET(ApiConstants.allProducts)
  Future<ProductResponse> getAllProducts();
}
