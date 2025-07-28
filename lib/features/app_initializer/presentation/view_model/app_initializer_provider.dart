import 'package:dobby/core/provider/global_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/features/translations/data/services/translations_service.dart';
import '../../../../shared/features/translations/domain/repositories_imp/translations_repository_imp.dart';
import '../../../../shared/features/translations/domain/usecases/get_translations_use_case.dart';
import 'app_initializer_view_model.dart';

final _translationsService = Provider(
  (ref) => TranslationsService(ref.read(dioClientProvider)),
);
final _translationsRepoImp = Provider(
  (ref) => TranslationsRepositoryImp(ref.read(_translationsService)),
);
final _getTranslationsUseCase = Provider(
  (ref) => GetTranslationsUseCase(ref.read(_translationsRepoImp)),
);
final appInitializerProvider =
    StateNotifierProvider<AppInitializerViewModel, AsyncValue<void>>((ref) {
      return AppInitializerViewModel(ref.read(_getTranslationsUseCase), ref);
    });
