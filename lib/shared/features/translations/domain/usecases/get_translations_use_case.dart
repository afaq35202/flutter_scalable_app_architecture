import 'package:dobby/core/utils/http_utils/api_response.dart';

import '../../data/repositories/translations_reporitory.dart';
import '../entities/translation_entity.dart';

class GetTranslationsUseCase {
  final TranslationsRepository _translationsRepository;

  GetTranslationsUseCase(this._translationsRepository);

  Future<ApiResponse<TranslationEntity>> call(String languageCode) {
    return _translationsRepository.getTranslations(languageCode);
  }
}
