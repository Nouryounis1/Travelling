import 'package:dio/dio.dart';

class DioHelper {
  static Dio? dio;

  static init() {
    dio = Dio(
      BaseOptions(
          baseUrl: 'http://mark.bslmeiyu.com/api/',
          receiveDataWhenStatusError: true),
    );
  }

  static Future<Response> getData({
    required String url,
    Map<String, dynamic>? query,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
    };
    return await dio!.get(url, queryParameters: query);
  }

  static Future<Response> postData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token ?? ''
    };

    return await dio!.post(url, queryParameters: query, data: data);
  }

  static Future<Response> putData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
    required Map<String, dynamic> data,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token ?? ''
    };

    return await dio!.put(url, queryParameters: query, data: data);
  }

  static Future<Response> deleteData({
    required String url,
    Map<String, dynamic>? query,
    String? token,
  }) async {
    dio!.options.headers = {
      'Content-Type': 'application/json',
      'lang': 'en',
      'Authorization': token ?? ''
    };

    return await dio!.delete(url, queryParameters: query);
  }
}
