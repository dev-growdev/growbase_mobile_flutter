import 'package:growbase_mobile_flutter/shared/data/models/http_response.model.dart';
import 'package:growbase_mobile_flutter/shared/data/errors/exceptions.dart';
import 'package:dio/dio.dart';

abstract class IHttpAdapter {
  Future<HttpResponse> get(String url, {Map<String, String> headers});

  Future<HttpResponse> post(String url, Map<String, dynamic>? data,
      {Map<String, String> headers});

  Future<HttpResponse> postUpload(String url, FormData data,
      {Map<String, String> headers});

  Future<HttpResponse> put(String url, Map<String, dynamic> data,
      {Map<String, String> headers});

  Future<HttpResponse> delete(String url,
      {Map<String, dynamic> data, Map<String, String> headers});

  Future<HttpResponse> download({required String url, required savePath});
}

class DioAdapter implements IHttpAdapter {
  Dio _dio;

  DioAdapter(this._dio);

  @override
  Future<HttpResponse> get(String url, {Map<String, String>? headers}) async {
    try {
      var result = await _dio.get(
        url,
        options: Options(headers: headers),
      );

      return HttpResponse(
        success: true,
        statusCode: result.statusCode!,
        result: result.data,
      );
    } on DioError catch (e) {
      return HttpResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 500,
        error: e.response?.data,
      );
    } catch (e) {
      throw AdapterException(
        'Aconteceu um erro não esperado, se persistir, entre em contato.',
      );
    }
  }

  @override
  Future<HttpResponse> post(String url, Map<String, dynamic>? data,
      {Map<String, String>? headers}) async {
    try {
      var result = await _dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );

      return HttpResponse(
        success: true,
        statusCode: result.statusCode!,
        result: result.data,
      );
    } on DioError catch (e) {
      return HttpResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 500,
        error: e.response?.data,
      );
    } catch (e) {
      throw AdapterException(
        'Aconteceu um erro não esperado, se persistir, entre em contato.',
      );
    }
  }

  @override
  Future<HttpResponse> delete(String url,
      {Map<String, dynamic>? data, Map<String, String>? headers}) async {
    try {
      var result = await _dio.delete(url,
          data: data, options: Options(headers: headers));

      return HttpResponse(
        success: true,
        statusCode: result.statusCode!,
        result: result.data,
      );
    } on DioError catch (e) {
      return HttpResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 500,
        error: e.response?.data,
      );
    } catch (e) {
      throw AdapterException(
        'Aconteceu um erro não esperado, se persistir, entre em contato.',
      );
    }
  }

  @override
  Future<HttpResponse> put(String url, Map<String, dynamic> data,
      {Map<String, String>? headers}) async {
    try {
      var result =
          await _dio.put(url, data: data, options: Options(headers: headers));

      return HttpResponse(
        success: true,
        statusCode: result.statusCode!,
        result: result.data,
      );
    } on DioError catch (e) {
      return HttpResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 500,
        error: e.response?.data,
      );
    } catch (e) {
      throw AdapterException(
        'Aconteceu um erro não esperado, se persistir, entre em contato.',
      );
    }
  }

  @override
  Future<HttpResponse> postUpload(String url, FormData data,
      {Map<String, String>? headers}) async {
    try {
      var result = await _dio.post(
        url,
        data: data,
        options: Options(headers: headers),
      );

      return HttpResponse(
        success: true,
        statusCode: result.statusCode!,
        result: result.data,
      );
    } on DioError catch (e) {
      return HttpResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 500,
        error: e.response?.data,
      );
    } catch (e) {
      throw AdapterException(
        'Aconteceu um erro não esperado, se persistir, entre em contato.',
      );
    }
  }

  @override
  Future<HttpResponse> download({
    required String url,
    required savePath,
  }) async {
    try {
      var result = await _dio.download(url, savePath);

      return HttpResponse(
        success: true,
        statusCode: result.statusCode!,
      );
    } on DioError catch (e) {
      return HttpResponse(
        success: false,
        statusCode: e.response?.statusCode ?? 500,
        error: e.response?.data,
      );
    } catch (e) {
      throw AdapterException(
        'Aconteceu um erro não esperado, se persistir, entre em contato.',
      );
    }
  }
}
