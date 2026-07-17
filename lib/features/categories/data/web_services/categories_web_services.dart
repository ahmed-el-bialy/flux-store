import 'package:dio/dio.dart';
import 'package:flux_store/core/constants/api_constants.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'categories_web_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class CategoriesWebServices {
  factory CategoriesWebServices(Dio dio, {String? baseUrl}) = _CategoriesWebServices;


  @GET("products/category/{category}")
  Future<ProductResponse> getProductsByCategory(
      @Path("category") String category,
      );
}
