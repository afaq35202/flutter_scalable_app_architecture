import 'package:dobby/core/utils/http_utils/api_response.dart';

import '../../domain/entities/translation_entity.dart';

abstract class TranslationsRepository {
  Future<ApiResponse<TranslationEntity>> getTranslations(String languageCode);
}
