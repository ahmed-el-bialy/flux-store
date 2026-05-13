import 'package:dio/dio.dart';
import 'package:flux_store/data/models/category_model.dart';
import 'package:flux_store/data/models/product_model.dart';
import 'package:retrofit/retrofit.dart';
import '../../core/constants/constants.dart';

part 'web_services.g.dart';

@RestApi(baseUrl: apiUrl)
abstract class WebServices {
  factory WebServices(Dio dio, {String? baseUrl}) = _WebServices;

  @GET("products")
  Future<ProductResponse> getAllProducts();

  @GET("products/categories")
  Future<List<CategoryModel>> getAllCategories();

  @GET("products/category/{category}")
  Future<ProductResponse> getProductsByCategory(
    @Path("category") String category,
  );
}
