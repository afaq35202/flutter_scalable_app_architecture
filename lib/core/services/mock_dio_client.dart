import 'dart:convert';

import 'package:yellowrock/core/constants/assets.dart';
import 'package:yellowrock/core/constants/http_constants.dart';
import 'package:yellowrock/core/services/api_client.dart';
import 'package:yellowrock/core/utils/http_utils/api_response.dart';
import 'package:yellowrock/core/utils/http_utils/enum_methods.dart';
import 'package:yellowrock/core/utils/logger.dart';
import 'package:flutter/services.dart';

class MockDioClient extends ApiClient {
  final _logger = Logger("MockDioClient");

  @override
  Future<ApiResponse<T>> request<T>({
    required String path,
    required HttpMethod method,
    Map<String, dynamic>? queryParameters,
    data,
    Map<String, dynamic>? headers,
    required T Function(dynamic json) parser,
  }) async {
    try{
      final json = await _loadJsonAsset("${Assets.mockResponse}$path.json");
      _logger.logInfo(functionName: "request", message: json.toString());
      final parsed = parser(json);
      return ApiResponse.success(parsed, statusCode: 200);
    }catch(e){
      _logger.logError(functionName: "request", error: e);
      return ApiResponse.failure(
        message: HttpConstants.somethingWentWrong,
        statusCode: 500,
      );
    }
  }

  Future<Map<String, dynamic>> _loadJsonAsset(String asset) async {
    final localData = await rootBundle.loadString(asset);
    return jsonDecode(localData) as Map<String, dynamic>;
  }

}
