import 'package:dio/dio.dart';
import 'package:flux_store/core/constants/api_constants.dart';
import 'package:flux_store/features/home/data/models/category_model.dart';
import 'package:flux_store/features/home/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET(ApiConstants.allProducts)
  Future<ProductResponse> getAllProducts();

  @GET("products/categories")
  Future<List<CategoryModel>> getAllCategories();

  @GET("products/category/{category}")
  Future<ProductResponse> getProductsByCategory(
    @Path("category") String category,
  );
}
