import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../features/app_initializer/presentation/view_model/app_initializer_view_model.dart';
import '../provider/global_providers.dart';

extension StringExtensions on String? {
  String getEndPointOfPath() {
    final input = this;
    if (input?.isEmpty ?? true) {
      return '';
    }
    return input?.split('/').last ?? '';
  }

  String tr(WidgetRef ref) {
    final translations = ref.watch(remoteTranslationsProvider);
    return translations.data?[this] ?? this??'';
  }
}
