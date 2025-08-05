import 'package:dobby/core/provider/global_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../shared/features/translations/data/services/translations_service.dart';
import '../../../../shared/features/translations/domain/repositories_imp/translations_repository_imp.dart';
import '../../../../shared/features/translations/domain/usecases/get_translations_use_case.dart';
import 'app_initializer_view_model.dart';

final _translationsService = Provider.autoDispose(
  (ref) => TranslationsService(ref.read(GlobalProviders.apiClientProvider)),
);
final _translationsRepoImp = Provider.autoDispose(
  (ref) => TranslationsRepositoryImp(ref.read(_translationsService)),
);
final _getTranslationsUseCase = Provider.autoDispose(
  (ref) => GetTranslationsUseCase(ref.read(_translationsRepoImp)),
);
final appInitializerProvider =
    StateNotifierProvider.autoDispose<AppInitializerViewModel, AsyncValue<void>>((ref) {
      return AppInitializerViewModel(ref.read(_getTranslationsUseCase), ref);
    });
