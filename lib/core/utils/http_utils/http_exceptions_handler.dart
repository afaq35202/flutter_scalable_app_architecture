import 'dart:io';

import 'package:dio/dio.dart';

import 'api_response.dart';

ApiResponse<T> handleException<T>(Object error, {int? statusCode}) {
  if (error is DioException) {
    return ApiResponse.failure(
      message: _mapDioError(error),
      statusCode: error.response?.statusCode,
    );
  } else if (error is SocketException) {
    return ApiResponse.failure(
      message: 'No Internet connection',
      statusCode: statusCode,
    );
  } else if (error is HttpException) {
    return ApiResponse.failure(
      message: 'HTTP error occurred',
      statusCode: statusCode,
    );
  } else if (error is FormatException) {
    return ApiResponse.failure(
      message: 'Invalid response format',
      statusCode: statusCode,
    );
  } else {
    return ApiResponse.failure(
      message: 'Unexpected error: $error',
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
