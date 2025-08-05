import 'package:dobby/core/constants/enums/app_client.dart';
import 'package:dobby/core/constants/enums/user_role.dart';
import 'package:dobby/core/services/api_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../shared/features/translations/domain/entities/translation_entity.dart';
import '../config/app_config.dart';
import '../services/dio_client.dart';

final class GlobalProviders {
  static final apiClientProvider = Provider<ApiClient>((ref) {
    return DioClient(); // default production client
  });

  static final appConfigProvider = StateProvider<AppConfig>(
    (ref) => AppConfig(
      role: parseRole('supervisor'),
      client: parseClient('default'),
    ),
  );

  static final remoteTranslationsProvider = StateProvider<TranslationEntity>(
    (ref) => TranslationEntity.initial(),
  );

  GlobalProviders._(); // Private constructor

  static final GlobalProviders instance = GlobalProviders._();

  ProviderContainer? _container;

  ProviderContainer get container {
    _container ??= ProviderContainer();
    return _container!;
  }

  T read<T>(ProviderListenable<T> provider) {
    return container.read(provider);
  }

  void setContainer(ProviderContainer container) {
    _container = container;
  }
}
