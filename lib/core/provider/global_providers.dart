import 'package:dobby/core/services/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/features/translations/domain/entities/translation_entity.dart';
import '../services/dio_client.dart';


final dioClientProvider = Provider<ApiClient>((ref) {
  return DioClient(); // default production client
});
final remoteTranslationsProvider = StateProvider<TranslationEntity>(
  (ref) => TranslationEntity.initial(),
);
