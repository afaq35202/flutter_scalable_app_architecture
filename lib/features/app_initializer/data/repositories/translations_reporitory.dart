import 'package:dobby/core/utils/http_utils/api_response.dart';

abstract class TranslationsRepository {
  Future<ApiResponse<T>> getTranslations<T>();
}
