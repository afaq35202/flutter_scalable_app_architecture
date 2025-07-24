import '../../constants/http_constants.dart';

class ApiResponse<T> {
  final T? data;
  final String? message;
  final bool success;
  final int? statusCode;

  ApiResponse({
    this.data,
    this.message,
    required this.success,
    this.statusCode,
  });

  factory ApiResponse.success(T data, {int? statusCode}) {
    return ApiResponse(data: data, success: true, statusCode: statusCode);
  }

  factory ApiResponse.failure({String? message, int? statusCode}) {
    return ApiResponse(
      data: null,
      message: message ?? HttpConstants.somethingWentWrong,
      success: false,
      statusCode: statusCode,
    );
  }
  ApiResponse<R> map<R>(R Function(T data) transform) {
    if (success && data != null) {
      return ApiResponse.success(
        transform(data as T),
        statusCode: statusCode,
      );
    } else {
      return ApiResponse.failure(
        message: message,
        statusCode: statusCode,
      );
    }
  }

}
