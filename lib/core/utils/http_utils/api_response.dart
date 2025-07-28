import 'package:dio/dio.dart';

import '../../constants/http_constants.dart';

class ApiResponse<T> extends Response<T> {
  final String? message;
  final bool success;

  ApiResponse({
    this.message,
    required this.success,
    required super.requestOptions,
    super.data,
    super.statusCode
  });

  factory ApiResponse.success(T data, {int? statusCode,RequestOptions? requestOptions}) {
    return ApiResponse(
      data: data,
      requestOptions: requestOptions??RequestOptions(),
      success: true,
      statusCode: statusCode
    );
  }

  factory ApiResponse.failure({String? message, int? statusCode}) {
    return ApiResponse(
      message: message ?? HttpConstants.somethingWentWrong,
      success: false,
      requestOptions: RequestOptions(),
    );
  }

  ApiResponse<R> map<R>(R Function(T data) transform) {
    if (success && data != null) {
      return ApiResponse.success(transform(data as T), statusCode: statusCode);
    } else {
      return ApiResponse.failure(message: message, statusCode: statusCode);
    }
  }
  factory ApiResponse.fromDioResponse(Response<T> response, {String? message}) {
    return ApiResponse<T>(
      data: response.data,
      requestOptions: response.requestOptions,
      statusCode: response.statusCode,
      message: message,
      success: response.statusCode != null && response.statusCode! >= 200 && response.statusCode! < 300,
    );
  }

}
