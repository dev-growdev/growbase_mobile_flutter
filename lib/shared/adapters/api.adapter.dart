import 'package:dio/dio.dart';

import '../../utils/constants/app.constants.dart';

abstract class IHttpAdapter {
  Future<Map<String, dynamic>> get(String url,
      {Map<String, String> queryParameters});

  Future<Map<String, dynamic>> post(String url, dynamic data,
      {Map<String, String> queryParameters});

  Future<Map<String, dynamic>> put(String url, dynamic data,
      {Map<String, String> queryParameters});

  Future<Map<String, dynamic>> delete(String url,
      {Map<String, dynamic> data, Map<String, String> queryParameters});
}

class ApiAdapter implements IHttpAdapter {
  final Dio _dio;

  ApiAdapter(this._dio);

  @override
  Future<Map<String, dynamic>> get(
    String url, {
    Map<String, String>? queryParameters,
  }) async {
    var result = await _dio.get(
      url,
      options: Options(headers: AppConstants.headerApi),
      queryParameters: queryParameters,
    );

    return result.data;
  }

  @override
  Future<Map<String, dynamic>> post(
    String url,
    dynamic data, {
    Map<String, String>? queryParameters,
  }) async {
    var result = await _dio.post(
      url,
      data: data,
      options: Options(headers: AppConstants.headerApi),
      queryParameters: queryParameters,
    );

    return result.data;
  }

  @override
  Future<Map<String, dynamic>> delete(
    String url, {
    Map<String, dynamic>? data,
    Map<String, String>? queryParameters,
  }) async {
    var result = await _dio.delete(
      url,
      data: data,
      options: Options(headers: AppConstants.headerApi),
      queryParameters: queryParameters,
    );

    return result.data;
  }

  @override
  Future<Map<String, dynamic>> put(
    String url,
    dynamic data, {
    Map<String, String>? queryParameters,
  }) async {
    var result = await _dio.put(
      url,
      data: data,
      options: Options(headers: AppConstants.headerApi),
      queryParameters: queryParameters,
    );

    return result.data;
  }
}
