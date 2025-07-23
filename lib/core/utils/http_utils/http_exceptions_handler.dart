import 'dart:io';

import 'package:dio/dio.dart';

import 'api_response.dart';

ApiResponse<T> handleException<T>(Object error, {int? statusCode}) {
  if (error is DioException) {
    return ApiResponse.failure(
      _mapDioError(error),
      statusCode: error.response?.statusCode,
    );
  } else if (error is SocketException) {
    return ApiResponse.failure(
      'No Internet connection',
      statusCode: statusCode,
    );
  } else if (error is HttpException) {
    return ApiResponse.failure('HTTP error occurred', statusCode: statusCode);
  } else if (error is FormatException) {
    return ApiResponse.failure(
      'Invalid response format',
      statusCode: statusCode,
    );
  } else {
    return ApiResponse.failure(
      'Unexpected error: $error',
      statusCode: statusCode,
    );
  }
}

String _mapDioError(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return 'Connection timeout';
    case DioExceptionType.badResponse:
      return 'Server error: ${e.response?.statusCode ?? 'Unknown'}';
    case DioExceptionType.cancel:
      return 'Request was cancelled';
    case DioExceptionType.connectionError:
      return 'Connection failed';
    default:
      return 'Unexpected Dio error';
  }
}
