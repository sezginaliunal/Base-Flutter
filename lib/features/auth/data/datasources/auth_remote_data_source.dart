import '../../../../core/errors/failures.dart';
import '../../../../core/network/dio_client.dart';
import '../../../../core/errors/result.dart';
import 'package:baseflutter/features/auth/domain/entities/user_entity.dart';

/// Remote data source for authentication
class AuthRemoteDataSource {
  final DioClient _dioClient;

  AuthRemoteDataSource(this._dioClient);

  /// Login with email and password
  Future<Result<UserEntity>> login({
    required String email,
    required String password,
  }) async {
    final result = await _dioClient.post<Map<String, dynamic>>(
      '/auth/login',
      data: {'email': email, 'password': password},
    );

    return result.map(
      success: (data) {
        // TODO: Parse user data from response
        // final user = UserEntity.fromJson(data);
        // return Success(user);
        return FailureResult<UserEntity>(
          const UnknownFailure(message: 'Not implemented'),
        );
      },
      failure: (failure) => FailureResult<UserEntity>(failure),
    );
  }

  /// Register a new user
  Future<Result<UserEntity>> register({
    required String email,
    required String password,
    required String name,
    String? surname,
  }) async {
    final result = await _dioClient.post<Map<String, dynamic>>(
      '/auth/register',
      data: {
        'email': email,
        'password': password,
        'name': name,
        'surname': surname,
      },
    );

    return result.map(
      success: (data) {
        // TODO: Parse user data from response
        // final user = UserEntity.fromJson(data);
        // return Success(user);
        return FailureResult<UserEntity>(
          const UnknownFailure(message: 'Not implemented'),
        );
      },
      failure: (failure) => FailureResult<UserEntity>(failure),
    );
  }

  /// Logout current user
  Future<Result<void>> logout() async {
    return await _dioClient.post<void>('/auth/logout');
  }

  /// Refresh access token
  Future<Result<String>> refreshToken() async {
    final result = await _dioClient.post<Map<String, dynamic>>('/auth/refresh');

    return result.map(
      success: (data) {
        // TODO: Extract token from response
        // final token = data['access_token'] as String;
        // return Success(token);
        return FailureResult<String>(
          const UnknownFailure(message: 'Not implemented'),
        );
      },
      failure: (failure) => FailureResult<String>(failure),
    );
  }

  /// Request password reset
  Future<Result<void>> forgotPassword(String email) async {
    return await _dioClient.post<void>(
      '/auth/forgot-password',
      data: {'email': email},
    );
  }

  /// Reset password with token
  Future<Result<void>> resetPassword({
    required String token,
    required String newPassword,
  }) async {
    return await _dioClient.post<void>(
      '/auth/reset-password',
      data: {'token': token, 'password': newPassword},
    );
  }

  /// Verify email
  Future<Result<void>> verifyEmail(String token) async {
    return await _dioClient.post<void>(
      '/auth/verify-email',
      data: {'token': token},
    );
  }
}
