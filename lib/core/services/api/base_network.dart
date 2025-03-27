import 'package:dio/dio.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:test_project/core/config/constants/app/app_urls.dart';
import 'package:test_project/core/services/network/network_service.dart';

class BaseNetwork {
  factory BaseNetwork() {
    return _instance;
  }

  BaseNetwork._internal() {
    final options = BaseOptions(
      baseUrl: AppUrls.baseUrl, // Temel API URL'sini buraya yaz
    );
    _dio = Dio(options);

    // İstek ve yanıt interceptor'ları ekleyebiliriz
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: _onRequest,
        onResponse: _onResponse,
        onError: _onError,
      ),
    );
  }
  final networkController = NetworkController();

  Future<void> _onError(
    DioException error,
    ErrorInterceptorHandler handler,
  ) async {
    if (error.response?.statusCode == null &&
        await networkController.isConnected() == false) {
      Get.snackbar('Hata', 'İnternet yok');
    }
    return handler.reject(error);
  }

  void _onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    return handler.next(response); // Devam et
  }

  void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    return handler.next(options); // Devam et
  }

  late Dio _dio;

  // Singleton pattern
  static final BaseNetwork _instance = BaseNetwork._internal();

  // GET isteği
  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        path,
        queryParameters: queryParameters,
      );
      return _parseResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // POST isteği
  Future<dynamic> post(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.post<dynamic>(path, data: data);
      return _parseResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // PUT isteği
  Future<dynamic> put(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.put<dynamic>(path, data: data);
      return _parseResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // DELETE isteği
  Future<dynamic> delete(String path, {Map<String, dynamic>? data}) async {
    try {
      final response = await _dio.delete<dynamic>(path, data: data);
      return _parseResponse(response);
    } on DioException catch (e) {
      return _handleError(e);
    }
  }

  // Yanıtı parse etme
  dynamic _parseResponse(Response<dynamic> response) {
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data; // Yanıt başarılıysa dönen veriyi parse et
    } else {
      throw Exception('Error: ${response.statusCode}');
    }
  }

  // Hata yönetimi
  dynamic _handleError(dynamic error) async {
    if (error is DioException) {
      if (error.response != null) {
        return 'Error: ${error.response?.statusCode}, ${error.response?.data}';
      } else {
        return 'Error: ${error.message}';
      }
    } else {
      return 'Unknown error';
    }
  }
}
