import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
// import 'package:get/get.dart' hide FormData, MultipartFile, Response;
import 'package:path/path.dart' as path;
// import 'package:test_project/core/config/constants/routes/navigation_routes.dart';
import 'package:test_project/core/models/api_response.dart';
import 'package:test_project/core/services/network/network_service.dart';
import 'package:test_project/core/utils/response_message.dart';

import '../../config/constants/app/app_urls.dart';

class BaseNetwork {
  factory BaseNetwork() => _instance;

  BaseNetwork._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: BaseUrls.jsonPlaceholder.url,
        connectTimeout: const Duration(seconds: 40),
        receiveTimeout: const Duration(seconds: 40),
        sendTimeout: const Duration(seconds: 40),
        headers: {
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          // final token = LoginService().accessToken;
          // if (token.ext.isNotNullOrNoEmpty) {
          //   options.headers['Authorization'] = 'Bearer $token';
          // }
          // final fullUrl =
          // '${options.baseUrl}${options.path}?${options.queryParameters.isNotEmpty ? options.queryParameters : ''}';
          // debugPrint('🛰️ [REQUEST] ${options.method} => $fullUrl');
          // debugPrint('📦 Headers: ${options.headers}');
          return handler.next(options);
        },
        onResponse: (response, handler) async {
          return handler.next(response);
        },
        onError: (DioException e, handler) async {
          print(e);
          // final opts = e.requestOptions;
          // final statusCode = e.response?.statusCode ?? 0;

          // if (statusCode == HttpStatus.unauthorized &&
          //     !_isAuthRoute(Get.currentRoute)) {
          //   if (!_isUserLoggedIn || _sessionHandled) {
          //     return handler.reject(e);
          //   }
          //   // Eğer bu istek zaten bir refresh token isteği ise veya retry ise, direkt logout
          //   final isRetry = opts.extra['isRetry'] == true;
          //   final isRefreshRequest = opts.extra['isRefreshRequest'] == true;

          //   if (isRetry || isRefreshRequest) {
          //     await _authHandler(statusCode, 'sessionExpired'.tr);
          //     return handler.reject(e);
          //   }

          //   // Refresh işlemi devam ediyorsa bekle
          //   if (_isRefreshing) {
          //     try {
          //       await _refreshCompleter?.future;
          //       if (!_isUserLoggedIn) {
          //         return handler.reject(e);
          //       }
          //       // Refresh başarılı olduysa orijinal isteği tekrar dene
          //       final retryOpts = opts.copyWith(extra: {'isRetry': true});
          //       try {
          //         final cloneResponse = await _dio.request(
          //           retryOpts.path,
          //           data: retryOpts.data,
          //           queryParameters: retryOpts.queryParameters,
          //           options: Options(
          //             method: retryOpts.method,
          //             headers: retryOpts.headers,
          //             extra: retryOpts.extra,
          //           ),
          //         );
          //         return handler.resolve(cloneResponse);
          //       } catch (retryError) {
          //         return handler.reject(retryError as DioException);
          //       }
          //     } catch (_) {
          //       // Refresh başarısız olduysa reject et
          //       return handler.reject(e);
          //     }
          //   }

          //   // Refresh işlemini başlat
          //   _isRefreshing = true;
          //   _refreshCompleter = Completer<void>();

          //   try {
          //     // Refresh token isteğini manuel olarak yap (döngüyü engellemek için)
          //     final refreshToken = LoginService().refreshToken;
          //     final refreshTokenRequest = RefreshTokenRequest(
          //       refreshToken: refreshToken,
          //     );

          //     final refreshResponse = await _dio.post<dynamic>(
          //       AppUrls.refresh.url,

          //       data: refreshTokenRequest.toJson(),
          //       options: Options(extra: {'isRefreshRequest': true}),
          //     );

          //     if (refreshResponse.statusCode == 200 &&
          //         refreshResponse.data is Map<String, dynamic>) {
          //       final responseData =
          //           refreshResponse.data as Map<String, dynamic>;

          //       // Buraya LoginService'inizin model dönüşümünü yapın
          //       final loginData = LoginResponse.fromJson(responseData);

          //       // Şimdilik generic bir şekilde token'ı kaydet
          //       if (loginData.accessToken.ext.isNotNullOrNoEmpty) {
          //         // Token'ı güncelle - kendi metodunuzu kullanın
          //         await LoginService().setLoginResponse(loginData);
          //         _refreshCompleter?.complete();

          //         // Orijinal isteği retry et
          //         final retryOpts = opts.copyWith(extra: {'isRetry': true});
          //         try {
          //           final cloneResponse = await _dio.request(
          //             retryOpts.path,
          //             data: retryOpts.data,
          //             queryParameters: retryOpts.queryParameters,
          //             options: Options(
          //               method: retryOpts.method,
          //               headers: retryOpts.headers,
          //               extra: retryOpts.extra,
          //             ),
          //           );
          //           return handler.resolve(cloneResponse);
          //         } catch (retryError) {
          //           return handler.reject(retryError as DioException);
          //         }
          //       } else {
          //         throw Exception('Invalid refresh response');
          //       }
          //     } else {
          //       // Refresh başarısız, logout et
          //       _refreshCompleter?.completeError(Exception('Refresh failed'));
          //       await _authHandler(statusCode, 'sessionExpired'.tr);
          //       return handler.reject(e);
          //     }
          //   } catch (error) {
          //     _refreshCompleter?.completeError(error);
          //     await _authHandler(statusCode, 'sessionExpired'.tr);
          //     return handler.reject(e);
          //   } finally {
          //     _isRefreshing = false;
          //     _refreshCompleter = null;
          //   }
          // }

          // // Diğer hatalar
          // await _handleOtherErrors(e, statusCode);

          return handler.next(e);
        },
      ),
    );
  }

  static final BaseNetwork _instance = BaseNetwork._internal();
  final networkController = NetworkController();
  late final Dio _dio;
  Dio get dio => _dio;
  // bool _sessionHandled = false;

  // Token refresh kontrolü için
  // bool _isRefreshing = false;
  // Completer<void>? _refreshCompleter;
  // bool get _isUserLoggedIn => LoginService().accessToken.ext.isNotNullOrNoEmpty;
  // ------------------ 🧠 HTTP Request Helper ------------------

  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Object? json)? fromJsonT,
  }) => _request(
    'GET',
    path,
    queryParameters: queryParameters,
    fromJsonT: fromJsonT,
  );

  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    T Function(Object? json)? fromJsonT,
  }) => _request('POST', path, data: data, fromJsonT: fromJsonT);

  Future<ApiResponse<T>> put<T>(
    String path, {
    dynamic data,
    T Function(Object? json)? fromJsonT,
  }) => _request('PUT', path, data: data, fromJsonT: fromJsonT);

  Future<ApiResponse<T>> delete<T>(
    String path, {
    dynamic data,
    T Function(Object? json)? fromJsonT,
  }) => _request('DELETE', path, data: data, fromJsonT: fromJsonT);

  // ------------------ 📦 Multipart ------------------

  Future<ApiResponse<T>> postMultipart<T>({
    required String urlPath,
    required Map<String, String> fields,
    required Map<String, File> files,
    T Function(Object? json)? fromJsonT,
  }) async {
    // if (!await _checkConnection()) return _noNetwork<T>();

    final formData = FormData();
    fields.forEach((k, v) => formData.fields.add(MapEntry(k, v)));
    for (final entry in files.entries) {
      final file = await MultipartFile.fromFile(
        entry.value.path,
        filename: path.basename(entry.value.path),
      );
      formData.files.add(MapEntry(entry.key, file));
    }

    try {
      final response = await _dio.post<dynamic>(urlPath, data: formData);
      return _parseResponse<T>(response, fromJsonT);
    } catch (_) {
      return ApiResponse<T>(
        success: false,
        message: ResponseMessages.somethingError.name,
        statusCode: 0,
      );
    }
  }

  // ------------------ 🔧 Utility ------------------

  Future<ApiResponse<T>> _request<T>(
    String method,
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Object? json)? fromJsonT,
  }) async {
    // if (!await _checkConnection()) return _noNetwork<T>();
    try {
      final response = await _dio.request<dynamic>(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: method),
      );
      return _parseResponse<T>(response, fromJsonT);
    } catch (e) {
      // Hata interceptor içinde yakalanıyor zaten
      return ApiResponse<T>(
        success: false,
        message: ResponseMessages.somethingError.name,
        statusCode: 0,
      );
    }
  }

  ApiResponse<T> _parseResponse<T>(
    Response<dynamic> response,
    T Function(Object? json)? fromJsonT,
  ) {
    final statusCode = response.statusCode ?? 0;
    final body = response.data;
    if (body is Map<String, dynamic>) {
      return ApiResponse<T>(
        success: statusCode >= 200 && statusCode < 300,
        data: fromJsonT?.call(body),
        message: body['message']?.toString() ?? '',
        statusCode: statusCode,
      );
    }
    if (body is List) {
      return ApiResponse<T>(
        success: statusCode >= 200 && statusCode < 300,
        data: fromJsonT?.call(body),
        message: '',
        statusCode: statusCode,
      );
    }
    return ApiResponse<T>(
      success: false,
      message: ResponseMessages.somethingError.name,
      statusCode: statusCode,
    );
  }

  // Future<void> _handleOtherErrors(DioException e, int statusCode) async {
  //   final data = e.response?.data;

  //   // 🔹 "message" veya "durum" anahtarlarından biri varsa onu al
  //   final message = data is Map<String, dynamic>
  //       ? (data['message']?.toString().trim().isNotEmpty == true
  //             ? data['message'].toString()
  //             : data['durum']?.toString() ??
  //                   ResponseMessages.somethingError.message)
  //       : ResponseMessages.somethingError.message;

  //   if (e.type == DioExceptionType.connectionTimeout ||
  //       e.type == DioExceptionType.receiveTimeout ||
  //       e.type == DioExceptionType.sendTimeout) {
  //     await MyDialog.errorDialog('connectionTimeout'.tr);
  //   } else if (e.type == DioExceptionType.connectionError) {
  //     await MyDialog.errorDialog('no_network'.tr);
  //   } else if (statusCode == HttpStatus.tooManyRequests) {
  //     await MyDialog.errorDialog('tooManyRequest'.tr);
  //   } else if (statusCode == HttpStatus.notModified) {
  //     await MyDialog.errorDialog('notUpdated'.tr);
  //   } else if (statusCode == HttpStatus.forbidden) {
  //     await MyDialog.errorDialog(message);
  //   } else if (message.isNotEmpty) {
  //     await MyDialog.errorDialog(message);
  //   } else {
  //     await MyDialog.errorDialog(
  //       ResponseMessages.somethingError.message,
  //     );
  //   }
  // }

  // bool _isAuthRoute(String route) =>
  //     route == RoutesName.login ||
  //     route == RoutesName.register ||
  //     route == RoutesName.forgotPassword;

  // Future<void> _authHandler(int statusCode, String message) async {
  //   // ✅ ÇÖZÜM 3: Eğer zaten logout olduysa tekrar yapma
  //   if (_sessionHandled || !_isUserLoggedIn) return;

  //   _sessionHandled = true;

  //   try {
  //     if (_isAuthRoute(Get.currentRoute)) {
  //       await MyDialog.errorDialog(
  //         message.isNotEmpty ? message : 'somethingError'.tr,
  //       );
  //     } else {
  //       await MyDialog.errorDialog(message.tr);
  //       await LoginService().logout();
  //       // ✅ ÇÖZÜM 4: Logout sonrası flag'leri resetle
  //       resetSessionFlags();
  //     }
  //   } finally {
  //     // 1 saniye bekle ki diğer istekler de _sessionHandled=true görüp işlem yapmasın
  //     await Future.delayed(const Duration(seconds: 1));
  //     _sessionHandled = false;
  //   }
  // }

  void resetSessionFlags() {
    // _sessionHandled = false;
    // _isRefreshing = false;
    // _refreshCompleter = null;
  }
}

// sezginaliunal98@gmail.comimport 'dart:io';
