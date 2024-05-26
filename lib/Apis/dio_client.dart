import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  DioClient(this._dio);

  Future<Response> get(
    String url, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _dio.get(
        url,
        options: options,
        queryParameters: queryParameters,
      );

  Future<Response> post(
    String url, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async =>
      await _dio.post(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );

  Future<Response> delete(
    String url, {
    Options? options,
    Map<String, dynamic>? queryParameters,
  }) async =>
      await _dio.delete(
        url,
        options: options,
        queryParameters: queryParameters,
      );

  Future<Response> put(
    String url, {
    Options? options,
    Map<String, dynamic>? queryParameters,
    dynamic data,
  }) async =>
      await _dio.put(
        url,
        data: data,
      );
}
