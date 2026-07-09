import 'package:dio/dio.dart';
import '../../errors/failures.dart';

/// Dio interceptor for handling authentication tokens
class AuthInterceptor extends Interceptor {
  final Dio _dio;

  AuthInterceptor(this._dio);

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Add access token to headers if available
    final accessToken = await _getAccessToken();
    if (accessToken != null) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    // Handle 401 Unauthorized - try to refresh token
    if (err.response?.statusCode == 401) {
      final shouldRetry = await _tryRefreshToken();
      if (shouldRetry) {
        // Retry the original request with new token
        final accessToken = await _getAccessToken();
        if (accessToken != null) {
          final requestOptions = err.requestOptions;
          requestOptions.headers['Authorization'] = 'Bearer $accessToken';

          try {
            final response = await _dio.fetch(requestOptions);
            handler.resolve(response);
            return;
          } on DioException catch (e) {
            // If retry also fails, clear tokens and propagate error
            await _clearTokens();
            handler.next(
              DioException(
                requestOptions: err.requestOptions,
                error: AuthFailure(
                  message: 'Session expired. Please login again.',
                  code: 401,
                ),
                response: e.response,
                type: e.type,
              ),
            );
            return;
          }
        }
      }
    }

    handler.next(err);
  }

  /// Get access token from storage
  Future<String?> _getAccessToken() async {
    // TODO: Implement token storage (Hive, SharedPreferences, etc.)
    // For now, return null
    return null;
  }

  /// Get refresh token from storage
  Future<String?> _getRefreshToken() async {
    // TODO: Implement token storage (Hive, SharedPreferences, etc.)
    // For now, return null
    return null;
  }

  /// Try to refresh the access token
  Future<bool> _tryRefreshToken() async {
    final refreshToken = await _getRefreshToken();
    if (refreshToken == null) return false;

    try {
      // TODO: Implement refresh token API call
      // final response = await _dio.post(
      //   '/auth/refresh',
      //   data: {'refresh_token': refreshToken},
      // );
      // await _saveTokens(response.data['access_token'], response.data['refresh_token']);
      // return true;

      return false;
    } on DioException {
      await _clearTokens();
      return false;
    }
  }

  /// Clear tokens from storage
  Future<void> _clearTokens() async {
    // TODO: Implement token clearing
  }
}
