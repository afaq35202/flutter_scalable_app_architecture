import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:yellowrock/core/utils/http_utils/api_response.dart';
import 'package:flutter/foundation.dart';

class Logger {
  final String className;

  const Logger(this.className);

  void logError({
    required String functionName,
    required Object error,
    StackTrace? stackTrace,
  }) {
    final errorLog = '[ERROR] [$className -> $functionName] ❌: $error';
    debugPrint(errorLog);
    if (stackTrace != null) {
      debugPrint('[STACKTRACE]: $stackTrace');
    }
  }

  void logInfo({required String functionName, required String message}) {
    final infoLog = '[INFO] [$className -> $functionName] ℹ️: $message';
    debugPrint(infoLog);
  }

  void logWarning({required String functionName, required String message}) {
    final warnLog = '[WARN] [$className -> $functionName] ⚠️: $message';
    debugPrint(warnLog);
  }

  /// ✅ Delegates to ApiLogger
  void logApiRequest(RequestOptions options) {
    _ApiResponseLogger.logRequest(options);
  }

  /// ✅ Delegates to ApiLogger
  void logApiResponse(ApiResponse response) {
    _ApiResponseLogger.logResponse(response);
  }

  void logApiError({
    required String functionName,
    required DioException error,
    StackTrace? stackTrace,
  }) {
    _ApiResponseLogger.logDioError(
      functionName: functionName,
      className: className,
      error: error,
      stackTrace: stackTrace,
    );
  }
}

class _ApiResponseLogger {
  static void logResponse(ApiResponse<dynamic> response) {
    if (!kDebugMode) return; // Only log in debug mode

    final request = response.requestOptions;

    final baseUrl = request.baseUrl;
    final path = request.path;
    final method = request.method;
    final fullUrl = '$baseUrl$path';
    final headers = request.headers;
    final queryParameters = request.queryParameters;
    final requestData = request.data;
    final token = headers['Authorization'] ?? headers['authorization'];

    // Split long logs to avoid Android/iOS log truncation
    void printLong(String text) {
      const int chunkSize = 800;
      for (var i = 0; i < text.length; i += chunkSize) {
        debugPrint(
          text.substring(
            i,
            i + chunkSize > text.length ? text.length : i + chunkSize,
          ),
        );
      }
    }

    debugPrint('\n📦📦📦📦📦📦📦📦 RESPONSE LOG START 📦📦📦📦📦📦📦📦');
    debugPrint('🔹 METHOD      : $method');
    debugPrint('🔹 BASE URL    : $baseUrl');
    debugPrint('🔹 ENDPOINT    : $path');
    debugPrint('🔹 FULL URL    : $fullUrl');
    debugPrint('🔹 TOKEN       : $token');
    debugPrint('🔹 HEADERS     : ${jsonEncode(headers)}');
    if (queryParameters.isNotEmpty) {
      debugPrint('🔹 QUERY PARAMS: ${jsonEncode(queryParameters)}');
    }
    if (requestData != null) {
      debugPrint('📤 REQUEST DATA: ${_formatObject(requestData)}');
    }

    debugPrint('📥 STATUS CODE : ${response.statusCode}');
    debugPrint('📥 RESPONSE    :');
    printLong(_formatObject(response.data));

    debugPrint('📦📦📦📦📦📦📦📦 RESPONSE LOG END 📦📦📦📦📦📦📦📦\n');
  }

  static void logRequest(RequestOptions requestOptions) {
    if (!kDebugMode) return;

    final baseUrl = requestOptions.baseUrl;
    final path = requestOptions.path;
    final method = requestOptions.method;
    final fullUrl = '$baseUrl$path';
    final headers = requestOptions.headers;
    final queryParams = requestOptions.queryParameters;
    final body = requestOptions.data;

    String requestBody;
    if (body is FormData) {
      final fields = body.fields.map((e) => '${e.key}: ${e.value}').join(', ');
      final files = body.files
          .map((f) => '${f.key}: ${f.value.filename}')
          .join(', ');
      requestBody = 'FormData { fields: {$fields}, files: {$files} }';
    } else {
      requestBody = _formatObject(body);
    }

    final token = headers['Authorization'] ?? headers['authorization'];

    void printLong(String text) {
      const chunkSize = 800;
      for (var i = 0; i < text.length; i += chunkSize) {
        debugPrint(
          text.substring(
            i,
            i + chunkSize > text.length ? text.length : i + chunkSize,
          ),
        );
      }
    }

    debugPrint('\n📤📤📤📤📤📤📤📤 REQUEST LOG START 📤📤📤📤📤📤📤📤');
    debugPrint('🔹 METHOD     : $method');
    debugPrint('🔹 BASE URL   : $baseUrl');
    debugPrint('🔹 ENDPOINT   : $path');
    debugPrint('🔹 FULL URL   : $fullUrl');
    debugPrint('🔹 TOKEN      : $token');
    debugPrint('🔹 HEADERS    : ${_formatObject(headers)}');
    if (queryParams.isNotEmpty) {
      debugPrint('🔹 QUERY PARAMS: ${_formatObject(queryParams)}');
    }
    debugPrint('📤 BODY       :');
    printLong(requestBody);
    debugPrint('📤📤📤📤📤📤📤📤 REQUEST LOG END 📤📤📤📤📤📤📤📤\n');
  }

  static void logDioError({
    required String functionName,
    required String className,
    required DioException error,
    StackTrace? stackTrace,
  }) {
    if (!kDebugMode) return;

    final request = error.requestOptions;
    final method = request.method;
    final url = '${request.baseUrl}${request.path}';
    final statusCode = error.response?.statusCode;
    final responseBody = error.response?.data;

    debugPrint('\n❌❌❌❌❌❌❌❌ DIO ERROR START ❌❌❌❌❌❌❌❌');
    debugPrint('[ERROR] [$className -> $functionName]');
    debugPrint('🔹 URL         : $url');
    debugPrint('🔹 METHOD      : $method');
    debugPrint('🔹 ERROR TYPE  : ${error.type}');
    if (statusCode != null) debugPrint('🔹 STATUS CODE : $statusCode');
    if (responseBody != null) {
      debugPrint('🔹 RESPONSE    : ${_formatObject(responseBody)}');
    }
    debugPrint('🔹 MESSAGE     : ${error.message}');
    if (stackTrace != null) {
      debugPrint('🔹 STACKTRACE  : $stackTrace');
    }
    debugPrint('❌❌❌❌❌❌❌❌ DIO ERROR END ❌❌❌❌❌❌❌❌\n');
  }

  static String _formatObject(dynamic data) {
    try {
      if (data is String) return data;
      return const JsonEncoder.withIndent('  ').convert(data);
    } catch (_) {
      return data.toString();
    }
  }
}
