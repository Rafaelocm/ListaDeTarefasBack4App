import 'package:dio/dio.dart';
import 'package:estudobackapp/repositories/backapp_dio_interceptor.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Back4AppCustomDio {
  final _dio = Dio();

  Dio get dio => _dio;

  Back4AppCustomDio() {
    _dio.options.headers["content-type"] = "application/json";
    _dio.options.baseUrl = dotenv.get("BACK4APPBASEURL");
    //adicionando o intercpetors a custom dio para chama-lá no repository
    _dio.interceptors.add(Back4AppDioInterceptor());
  }
}
