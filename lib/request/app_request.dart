import 'package:dio/dio.dart';

class AppRequestType {
  final _dio = Dio(BaseOptions(
    baseUrl: 'http://localhost:8080/chengbeibei/',
    connectTimeout: Duration(seconds: 5),
    receiveTimeout: Duration(seconds: 10),
  ));
  Dio getDio() {
    return _dio;
  }

}