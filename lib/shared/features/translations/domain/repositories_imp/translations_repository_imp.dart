import 'package:dobby/core/utils/http_utils/api_response.dart';

import '../../data/repositories/translations_reporitory.dart';
import '../../data/services/translations_service.dart';
import '../entities/translation_entity.dart';

class TranslationsRepositoryImp extends TranslationsRepository{

  final TranslationsService _translationsService;

  TranslationsRepositoryImp(this._translationsService);

  @override
  Future<ApiResponse<TranslationEntity>> getTranslations(String languageCode) {
    return _translationsService.getTranslations(languageCode);
  }

}
