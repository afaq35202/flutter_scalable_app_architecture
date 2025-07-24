import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../provider/global_providers.dart';
import '../services/dio_client.dart';
import '../services/mock_dio_client.dart';

enum AppEnvironment { development, staging, production }

AppEnvironment currentEnv =
    AppEnvironment.development; // Or from `--dart-define`

List<Override> getEnvOverrides() {
  switch (currentEnv) {
    case AppEnvironment.development:
      return [dioClientProvider.overrideWithValue(MockDioClient())];
    case AppEnvironment.staging:
      return [dioClientProvider.overrideWithValue(DioClient())];
    default:
      return [];
  }
}
