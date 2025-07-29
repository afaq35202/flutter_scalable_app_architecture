import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/provider/global_providers.dart';
import '../../core/services/dio_client.dart';
import '../../core/services/mock_dio_client.dart';

enum EnvironmentMode { development, staging, production }

class AppEnvironment {
  static EnvironmentMode currentEnv =
      EnvironmentMode.development; // Or from `--dart-define`

  static List<Override> getEnvOverrides() {
    switch (currentEnv) {
      case EnvironmentMode.production:
        return [apiClientProvider.overrideWithValue(DioClient())];
      // case 'staging':
      //   currentEnv = EnvironmentMode.staging;
      //   break;
      // case 'dev':
      default:
        return [apiClientProvider.overrideWithValue(MockDioClient()),];
    }
  }
}
