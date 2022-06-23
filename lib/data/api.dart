import 'package:dio/dio.dart';
import 'dart:developer' as developer;

Api api = Api();

class Api{

  String url = 'https://mocki.io/v1/9a3d57b9-fa3f-402e-99f9-982134108d18';

  Dio getDio() {
    return Dio(BaseOptions(
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
      headers: {'Content-Type': 'application/json'},
    ));
  }

  Future<dynamic> requestOtp() async {
    Response? result;
    try {
      Dio dio = getDio();
      result = await dio.get(url);
    } on DioError catch (e) {
      developer.log(e.toString());
    }
    if (result != null) {
      developer.log(result.data['otp_code'].toString());
      return result;
    }
    return null;
  }
}