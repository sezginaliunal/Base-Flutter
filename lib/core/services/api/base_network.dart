import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:test_project/core/config/constants/app/app_urls.dart';
import 'package:test_project/core/config/constants/routes/navigation_routes.dart';
import 'package:test_project/core/models/api_response.dart';
import 'package:test_project/core/services/network/network_service.dart';
import 'package:test_project/core/utils/dialogs.dart';
import 'package:test_project/core/utils/logger.dart';
import 'package:test_project/core/utils/response_message.dart';
import 'package:path/path.dart' as path;

class BaseNetwork {
  factory BaseNetwork() => _instance;
  BaseNetwork._internal();

  static final BaseNetwork _instance = BaseNetwork._internal();
  final networkController = NetworkController();

  // GET isteği, path String olarak alınıyor
  Future<ApiResponse<T>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    T Function(Object? json)? fromJsonT,
    bool isApiResponse = false,
    String? baseUrl,
  }) async {
    final uri = _buildUri(path, queryParameters, baseUrl);
    final headers = await _buildHeaders();
    return _sendRequest<T>(
      () => http.get(uri, headers: headers),
      fromJsonT,
      isApiResponse: isApiResponse,
    );
  }

  // POST isteği, path String olarak alınıyor (AppUrls değil)
  Future<ApiResponse<T>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Object? json)? fromJsonT,
    bool isApiResponse = false,
    String? baseUrl,
  }) async {
    final uri = _buildUri(path, queryParameters, baseUrl);
    final headers = await _buildHeaders();
    return _sendRequest<T>(
      () => http.post(uri, headers: headers, body: jsonEncode(data)),
      fromJsonT,
      isApiResponse: isApiResponse,
    );
  }

  Future<ApiResponse<T>> put<T>(
    String path, {
    dynamic data,
    T Function(Object? json)? fromJsonT,
    bool isApiResponse = false,
    String? baseUrl,
  }) async {
    final uri = _buildUri(path, null, baseUrl);
    final headers = await _buildHeaders();
    return _sendRequest<T>(
      () => http.put(uri, headers: headers, body: jsonEncode(data)),
      fromJsonT,
      isApiResponse: isApiResponse,
    );
  }

  Future<ApiResponse<T>> delete<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    T Function(Object? json)? fromJsonT,
    bool isApiResponse = false,
    String? baseUrl,
  }) async {
    final uri = _buildUri(path, queryParameters, baseUrl);
    final headers = await _buildHeaders();
    return _sendRequest<T>(
      () async {
        final request =
            http.Request('DELETE', uri)
              ..headers.addAll(headers)
              ..body = jsonEncode(data);
        final streamedResponse = await request.send();
        return http.Response.fromStream(streamedResponse);
      },
      fromJsonT,
      isApiResponse: isApiResponse,
    );
  }

  Future<ApiResponse<T>> postMultipart<T>({
    required String urlPath,
    required Map<String, String> fields,
    required Map<String, File> files,
    T Function(Object? json)? fromJsonT,
    bool isApiResponse = false,
    String? baseUrl,
  }) async {
    final hasConnection = true; // await networkController.isConnected();
    if (!hasConnection) {
      MyDialog.errorDialog('no_network'.tr);
      return ApiResponse<T>(
        success: false,
        message: 'no_network'.tr,
        statusCode: 0,
      );
    }

    try {
      final uri = _buildUri(urlPath, null, baseUrl);
      final request = http.MultipartRequest('POST', uri);
      request.fields.addAll(fields);

      for (final entry in files.entries) {
        final file = await http.MultipartFile.fromPath(
          entry.key,
          entry.value.path,
          filename: path.basename(entry.value.path),
        );
        request.files.add(file);
      }

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return _parseResponse<T>(
        response,
        fromJsonT,
        isApiResponse: isApiResponse,
      );
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  Future<ApiResponse<T>> _sendRequest<T>(
    Future<http.Response> Function() requestFn,
    T Function(Object? json)? fromJsonT, {
    bool isApiResponse = false,
  }) async {
    final hasConnection = true; // await networkController.isConnected();
    if (!hasConnection) {
      MyDialog.errorDialog('no_network'.tr);
      return ApiResponse<T>(
        success: false,
        message: 'no_network'.tr,
        statusCode: 0,
      );
    }

    try {
      final response = await requestFn();
      return _parseResponse<T>(
        response,
        fromJsonT,
        isApiResponse: isApiResponse,
      );
    } catch (e) {
      return _handleError<T>(e);
    }
  }

  ApiResponse<T> _parseResponse<T>(
    http.Response response,
    T Function(Object? json)? fromJsonT, {
    bool isApiResponse = false,
  }) {
    try {
      final statusCode = response.statusCode;
      final body = jsonDecode(response.body);

      if (kDebugMode) {
        print('🟢 RESPONSE ALINDI');
        print('StatusCode: $statusCode');
        print('Body: $body');
      }

      if (body is Map<String, dynamic>) {
        if (statusCode >= 200 && statusCode < 300) {
          if (isApiResponse) {
            return ApiResponse<T>.fromJson(body, fromJsonT ?? (_) => null as T);
          } else {
            return ApiResponse<T>(
              success: true,
              data: fromJsonT?.call(body),
              message: '',
              statusCode: statusCode,
            );
          }
        } else {
          return _handleHttpError<T>(statusCode, body);
        }
      } else {
        return ApiResponse<T>(
          success: false,
          message: ResponseMessages.somethingError.message.localizeMessage,
          statusCode: statusCode,
        );
      }
    } catch (e) {
      return ApiResponse<T>(
        success: false,
        message:
            '${ResponseMessages.somethingError.message.localizeMessage} (${e.toString()})',
        statusCode: response.statusCode,
      );
    }
  }

  ApiResponse<T> _handleHttpError<T>(
    int statusCode,
    Map<String, dynamic> body,
  ) {
    final rawMessage = body['message']?.toString().tr;

    if (statusCode == HttpStatus.unauthorized &&
        Get.currentRoute != RoutesName.login) {
      // AuthService().sessionExpired();
    }

    if (statusCode == HttpStatus.notModified) {
      MyDialog.errorDialog('notUpdated'.tr);
    }

    if (statusCode == HttpStatus.tooManyRequests) {
      MyDialog.errorDialog('tooManyRequest'.tr);
    }

    return ApiResponse<T>(
      success: false,
      message:
          rawMessage ?? ResponseMessages.somethingError.message.localizeMessage,
      statusCode: statusCode,
    );
  }

  ApiResponse<T> _handleError<T>(Object e) {
    if (kDebugMode) {
      Logger.log(LogLevel.error, '🔥 HTTP ERROR: ${e.toString()}');
    }

    return ApiResponse<T>(
      success: false,
      message: ResponseMessages.somethingError.message.localizeMessage,
      statusCode: 0,
    );
  }

  Future<Map<String, String>> _buildHeaders() async {
    return {'Content-Type': 'application/json'};
  }

  Uri _buildUri(
    String path, [
    Map<String, dynamic>? queryParameters,
    String? baseUrl,
  ]) {
    if (path.startsWith('http://') || path.startsWith('https://')) {
      final uri = Uri.parse(path).replace(
        queryParameters: queryParameters?.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
      );
      if (kDebugMode) print('🟢 TAM URL ALGILANDI: $uri');
      return uri;
    }

    final base = Uri.parse(baseUrl ?? BaseUrls.myApi.url);
    final fullPath = path.startsWith('/') ? path.substring(1) : path;

    final uri = base.replace(
      path: '${base.path}/$fullPath',
      queryParameters: queryParameters?.map(
        (key, value) => MapEntry(key, value.toString()),
      ),
    );

    if (kDebugMode) print('🟢 URI OLUŞTURULDU: $uri');
    return uri;
  }
}
