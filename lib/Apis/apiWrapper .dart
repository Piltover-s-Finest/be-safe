// ignore: file_names,depend_on_referenced_packages
import 'package:dio/dio.dart';

class ApiWrapper {
  final  _dio = Dio();

  Future<dynamic> get({required String url, Map<String, dynamic>? queryParameters}) async {
      try {
        Response response = await _dio.get(url, queryParameters: queryParameters);
        return response.data;
      } catch (e) {
        rethrow;
      }
  }

  Future<dynamic> post({required String url, required Map<String, dynamic> data}) async {
    try {
      Response response = await _dio.post(url, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> delete({required String url}) async {
    try {
      Response response = await _dio.delete(url);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> put({required String url, required Map<String, dynamic> data}) async {
    try {
      Response response = await _dio.put(url, data: data);
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}