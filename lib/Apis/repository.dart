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

  Future<void> register({
    required String email,
    required String name,
    required String phoneNumber,
    required String password,
    required String address,
  }) async {
    return _errorWrapper(() async {
      await _client.post(
        '/account/registerPatient',
        data: {
          'name': name,
          'email': email,
          'password': password,
          'phoneNumber': phoneNumber,
          'address': address,
        },
      );
    });
  }

  Future<void> sendResetPasswordOTP(String email) async {
    return _errorWrapper(() async {
      await _client.post(
        '/account/sendEmailResetPassword',
        data: {'email': email},
      );
    });
  }

  Future<void> sendEmailVerification(String email) async {
    return _errorWrapper(() async {
      await _client.post(
        '/account/sendEmailVerification',
        data: {'email': email},
      );
    });
  }

  Future<UserModel> verifyEmail(String email, String otp) async {
    return _errorWrapper(() async {
      final response = await _client.post(
        '/account/verifyEmail',
        data: {
          'email': email,
          'otp': otp,
        },
      );
      return UserModel.fromJson(response.data);
    });
  }

  Future<void> resetPassword(
    String email,
    String password,
    String otp,
  ) async {
    return _errorWrapper(() async {
      await _client.post(
        '/account/resetPassword',
        data: {
          'email': email,
          'password': password,
          'otp': otp,
        },
      );
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
            e.response?.statusCode,
          );
        } else {
          throw ServerException(
            e.response?.data['message'] ?? 'Server error',
            e.response?.statusCode,
          );
        }
      }
    }
  }
}
