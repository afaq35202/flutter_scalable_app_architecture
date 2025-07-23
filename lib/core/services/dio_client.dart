import 'package:dio/dio.dart';
import 'package:dobby/core/services/api_client.dart';

import '../utils/http_utils/api_response.dart';
import '../utils/http_utils/enum_methods.dart';
import '../utils/http_utils/http_exceptions_handler.dart';

class DioClient extends ApiClient {
  final Dio _dio;

  DioClient({Dio? dio})
    : _dio =
          dio ?? Dio(BaseOptions(connectTimeout: const Duration(seconds: 10)));

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
