import 'package:yellowrock/core/services/api_client.dart';
import 'package:yellowrock/core/utils/http_utils/api_response.dart';
import 'package:yellowrock/core/utils/http_utils/enum_methods.dart';
import 'package:yellowrock/core/utils/logger.dart';


import '../../domain/entities/translation_entity.dart';
import '../model/translations_model.dart';
import '../source/app_initializer_end_points.dart';

class TranslationsService {
  final ApiClient _client;
  final _logger = Logger("TranslationsService");

  TranslationsService(this._client);

  Future<ApiResponse<TranslationEntity>> getTranslations(String languageCode) async {
    try {
      final response = await _client.request<TranslationsModel>(
        path: AppInitializerEndPoints.getTranslations+languageCode,
        method: HttpMethod.get,
        queryParameters: {"origin":"mobile"},
        parser: (json) => TranslationsModel.fromJson(json),
      );
      return response.map((model) => model.toEntity());
    } catch (e) {
      _logger.logError(functionName: "getTranslations", error: e);
      return ApiResponse.failure();
    }
  }
}
