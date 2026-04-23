import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();

  Future<dynamic> get({required String url}) async {
    try {
      Response response = await dio.get(url);
      return response.data;
    } on Exception catch (e) {
      throw Exception("there was an Error : $e");
    }
  }
}
