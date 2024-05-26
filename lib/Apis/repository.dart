import 'package:be_safe3/Apis/dio_client.dart';
import 'package:be_safe3/Apis/exceptions.dart';
import 'package:be_safe3/models/user_model.dart';
import 'package:dio/dio.dart';

class MainRepository {
  final DioClient _client;

  MainRepository(this._client);

  Future<UserModel> login(String email, String password) async {
    return _errorWrapper(() async {
      final response = await _client.post(
        '/login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return UserModel.fromJson(response.data);
    });
  }

  Future<T> _errorWrapper<T>(
    Future<T> Function() request, {
    Future<T> Function(DioException e)? onError,
  }) async {
    try {
      return await request();
    } on DioException catch (e) {
      if (onError != null) {
        return onError(e);
      } else {
        final statusCode = e.response?.statusCode;
        if (statusCode == 400) {
          throw ValidationException(
            e.response?.data['message'] ?? 'Validation error',
            List<String>.from(e.response?.data['errors'] ?? []),
          );
        } else {
          throw ServerException(
            e.response?.data['message'] ?? 'Server error',
          );
        }
      }
    }
  }
}