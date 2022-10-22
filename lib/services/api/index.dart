import 'package:dio/dio.dart';
import 'package:movie/services/api/interceptors.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: "https://api.jsonbin.io/v3/b",
            receiveTimeout: 30000,
            sendTimeout: 30000,
          ),
        )..interceptors.add(CustomInterceptors());

  Future<Response> getRequest(String path, [bool isAuth = false]) async {
    if (isAuth) {
      print("Auth required");
      return dio.get(path, options: Options(headers: {"X-ACCESS-KEY": "\$2b\$10\$K0dyyXyIV7Pt3mWPyiKwDeQiZh1z1Hni4nkWvPZL1mQ9/UW3eeaB6"}));
    } else {
      return dio.get(path);
    }
  }

  Future<Response> postRequest(String path, {bool isAuth = true, dynamic body}) async {
    if (isAuth) {
      print("Auth required");
      return dio.post(path, data: body, options: Options(headers: {"Authorization": ""}));
    } else {
      return dio.post(path, data: body);
    }
  }

  Future<Response> putRequest(String path, {bool isAuth = true, dynamic body}) async {
    if (isAuth) {
      print("Auth required");
      return dio.put(path, data: body, options: Options(headers: {"Authorization": ""}));
    } else {
      return dio.put(path, data: body);
    }
  }

  Future<Response> deleteRequest(String path, {bool isAuth = true, dynamic body}) async {
    if (isAuth) {
      print("Auth required");
      return dio.delete(path, data: body, options: Options(headers: {"Authorization": ""}));
    } else {
      return dio.delete(path, data: body);
    }
  }
}
