import '../provider/global_providers.dart';

extension StringExtensions on String? {
  String get getEndPointOfPath {
    final input = this;
    if (input?.isEmpty ?? true) {
      return '';
    }
    return input?.split('/').last ?? '';
  }

  String get tr {
    final translations = GlobalProviders.instance.read(
      GlobalProviders.remoteTranslationsProvider,
    );
    return translations.data?[this] ?? this ?? '';
  }
}
