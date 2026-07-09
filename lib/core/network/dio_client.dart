import 'package:dio/dio.dart';
import '../constants/app_constants.dart';
import '../errors/failures.dart';
import '../errors/result.dart';
import 'interceptors/auth_interceptor.dart';

/// Centralized Dio client for network requests
class DioClient {
  late final Dio _dio;
  final AuthInterceptor _authInterceptor;

  DioClient({required AuthInterceptor authInterceptor, Dio? dio})
    : _authInterceptor = authInterceptor,
      _dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: AppConstants.apiBaseUrl,
              connectTimeout: const Duration(
                milliseconds: AppConstants.apiTimeout,
              ),
              receiveTimeout: const Duration(
                milliseconds: AppConstants.apiTimeout,
              ),
              sendTimeout: const Duration(
                milliseconds: AppConstants.apiTimeout,
              ),
              headers: {
                'Content-Type': 'application/json',
                'Accept': 'application/json',
              },
            ),
          ) {
    _setupInterceptors();
  }

  /// Setup Dio interceptors
  void _setupInterceptors() {
    _dio.interceptors.add(_authInterceptor);

    // Add logging interceptor in debug mode
    if (const bool.fromEnvironment('dart.vm.product') == false) {
      _dio.interceptors.add(
        LogInterceptor(
          request: true,
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          error: true,
        ),
      );
    }
  }

  /// GET request
  Future<Result<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.get<T>(
        path,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response.data as T);
    } on DioException catch (e) {
      return _handleError<T>(e);
    } catch (e) {
      return FailureResult<T>(
        UnknownFailure(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  /// POST request
  Future<Result<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.post<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response.data as T);
    } on DioException catch (e) {
      return _handleError<T>(e);
    } catch (e) {
      return FailureResult<T>(
        UnknownFailure(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  /// PUT request
  Future<Result<T>> put<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.put<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response.data as T);
    } on DioException catch (e) {
      return _handleError<T>(e);
    } catch (e) {
      return FailureResult<T>(
        UnknownFailure(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  /// DELETE request
  Future<Result<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {
    try {
      final response = await _dio.delete<T>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
      );

      return Success(response.data as T);
    } on DioException catch (e) {
      return _handleError<T>(e);
    } catch (e) {
      return FailureResult<T>(
        UnknownFailure(message: 'An unexpected error occurred: $e'),
      );
    }
  }

  /// Handle Dio errors and convert to Failure
  Result<T> _handleError<T>(DioException error) {
    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return FailureResult<T>(
        NetworkFailure(
          message: 'Connection timeout. Please try again.',
          code: -1,
        ),
      );
    }

    if (error.type == DioExceptionType.connectionError) {
      return FailureResult<T>(
        NetworkFailure(
          message: 'No internet connection. Please check your network.',
          code: -1,
        ),
      );
    }

    if (error.response != null) {
      final statusCode = error.response!.statusCode ?? 0;
      final message =
          error.response!.data?['message']?.toString() ??
          error.message ??
          'Unknown error occurred';

      switch (statusCode) {
        case 400:
          return FailureResult<T>(
            ValidationFailure(message: message, code: statusCode),
          );
        case 401:
        case 403:
          return FailureResult<T>(
            AuthFailure(message: message, code: statusCode),
          );
        case 404:
          return FailureResult<T>(
            UnknownFailure(message: 'Resource not found.', code: statusCode),
          );
        case 500:
        case 502:
        case 503:
          return FailureResult<T>(
            ServerFailure(
              message: 'Server error. Please try again later.',
              code: statusCode,
            ),
          );
        default:
          return FailureResult<T>(
            UnknownFailure(message: message, code: statusCode),
          );
      }
    }

    return FailureResult<T>(
      UnknownFailure(message: error.message ?? 'An unknown error occurred'),
    );
  }

  /// Get the underlying Dio instance
  Dio get dio => _dio;

  /// Close the Dio client
  void close() {
    _dio.close();
  }
}
