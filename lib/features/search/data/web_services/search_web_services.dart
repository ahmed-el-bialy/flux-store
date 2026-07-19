import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../home/data/models/product_model.dart';

part 'search_web_services.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class SearchWebServices {
  factory SearchWebServices(Dio dio, {String? baseUrl}) = _SearchWebServices;

  @GET(ApiConstants.search)
  Future<ProductResponse> searchForProduct(@Path("query") String query);
}
