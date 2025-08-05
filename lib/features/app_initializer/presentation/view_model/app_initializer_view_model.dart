import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/provider/global_providers.dart';
import '../../../../shared/features/translations/domain/entities/translation_entity.dart';
import '../../../../shared/features/translations/domain/usecases/get_translations_use_case.dart';

class AppInitializerViewModel extends StateNotifier<AsyncValue<void>> {
  final GetTranslationsUseCase getTranslationsUseCase;
  final Ref ref; // <-- inject this

  AppInitializerViewModel(this.getTranslationsUseCase, this.ref)
    : super(const AsyncLoading()){
    _initialize();
  }
  Future<void> _initialize() async {
    try {
      await Future.wait([
        _fetchTranslations(),
        // _callApi2(),
        // _callApi3(),
      ]);
      state = const AsyncData(null);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }
  Future<void> _fetchTranslations() async {
    try {
      final response = await getTranslationsUseCase.call("en");
      if (response.success) {
        ref.read(GlobalProviders.remoteTranslationsProvider.notifier).state =
            response.data ?? TranslationEntity.initial();
      }else{
        throw Exception();
      }

    } catch (e) {}
  }
}
