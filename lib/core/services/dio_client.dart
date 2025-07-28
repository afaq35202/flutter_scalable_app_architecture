import 'package:dio/dio.dart';
import 'package:yellowrock/app/env/environment.dart';
import 'package:yellowrock/core/services/api_client.dart';

import '../utils/http_utils/api_response.dart';
import '../utils/http_utils/enum_methods.dart';
import '../utils/http_utils/http_exceptions_handler.dart';
import '../utils/logger.dart';

final _logger = Logger("DioClient");

class DioClient extends ApiClient {
  final Dio _dio;

  DioClient({Dio? dio})
    : _dio =
          dio ??
                Dio(
                  BaseOptions(
                    baseUrl: Env.baseUrl,
                    connectTimeout: const Duration(seconds: 10),
                  ),
                )
            ..interceptors.add(
              InterceptorsWrapper(
                onRequest: (requestOptions, handler) {
                  _logger.logApiRequest(requestOptions);
                  return handler.next(requestOptions);
                },
                onResponse: (response, handler) {
                  _logger.logApiResponse(ApiResponse.fromDioResponse(response));
                  return handler.next(response);
                },
                onError: (err, handler) {
                  _logger.logApiError(
                    functionName: "onError",
                    error: err,
                    stackTrace: err.stackTrace,
                  );
                  return handler.next(err);
                },
              ),
            );

  @override
  Future<ApiResponse<T>> request<T>({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
    required T Function(dynamic json) parser,
  }) async {
    try {
      final response = await _dio.request(
        path,
        data: data,
        queryParameters: queryParameters,
        options: Options(method: methodToString(method), headers: headers),
      );

      final statusCode = response.statusCode ?? 0;
      final parsed = parser(response.data);
      return ApiResponse.success(parsed, statusCode: statusCode);
    } catch (e) {
      return handleException<T>(e);
    }
  }
}
