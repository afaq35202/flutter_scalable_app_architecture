import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/global_providers.dart';
import '../../../../shared/features/translations/domain/entities/translation_entity.dart';
import '../../../../shared/features/translations/domain/usecases/get_translations_use_case.dart';
import 'app_initializer_state.dart';

class AppInitializerViewModel extends StateNotifier<AppInitializerState> {
  final GetTranslationsUseCase getTranslationsUseCase;
  final Ref ref; // <-- inject this

  AppInitializerViewModel(this.getTranslationsUseCase, this.ref)
    : super(AppInitializerState.initial()) {
    fetchItems();
  }

  Future<void> fetchItems() async {
    state = state.copyWith(isLoading: true);
    try {
      final response = await getTranslationsUseCase.call();
      if (response.success) {
        ref.read(remoteTranslationsProvider.notifier).state =
            response.data ?? TranslationEntity.initial();
      }
      state = state.copyWith(isLoading: false);
    } catch (e) {
      state = state.copyWith(isLoading: false);
    }
  }
}
