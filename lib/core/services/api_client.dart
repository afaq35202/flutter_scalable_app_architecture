import '../utils/http_utils/api_response.dart';
import '../utils/http_utils/enum_methods.dart';

abstract class ApiClient {
  Future<ApiResponse<T>> request<T>({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    dynamic data,
    Map<String, dynamic>? headers,
    required T Function(dynamic json) parser,
  });
}
