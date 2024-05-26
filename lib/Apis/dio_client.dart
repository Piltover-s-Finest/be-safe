import 'package:dio/dio.dart';

class DioClient {
  DioClient(this._dio);
  final Dio _dio;

  Future<dynamic> get(
      {required String url, Map<String, dynamic>? queryParameters}) async {
    return await _dio.get(url, queryParameters: queryParameters);
  }

  Future<dynamic> post(
      {required String url, required Map<String, dynamic> data}) async {
    return await _dio.post(url, data: data);
  }

  Future<dynamic> delete({required String url}) async {
    return await _dio.delete(url);
  }

  Future<dynamic> put(
      {required String url, required Map<String, dynamic> data}) async {
    return await _dio.put(url, data: data);
  }
}
