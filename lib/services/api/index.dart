import 'dart:io';

import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService()
      : dio = Dio(
          BaseOptions(
            baseUrl: "http://localhost:5500",
            receiveTimeout: 30000,
            sendTimeout: 30000,
            responseType: ResponseType.json,
          ),
        );

  Future<Response> getRequest(String path, [bool isAuth = false]) async {
    if (isAuth) {
      print("Auth required");
      return await dio.get(path, options: Options(headers: {"Authorization": ""}));
    } else {
      return await dio.get(path, options: Options(responseType: ResponseType.plain));
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
