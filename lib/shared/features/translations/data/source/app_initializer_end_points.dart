import 'package:dobby/app/env/app_environment.dart';

abstract final class AppInitializerEndPoints {
  static String get getTranslations {
    switch (AppEnvironment.currentEnv) {
      case EnvironmentMode.development:
        return 'translations/';
      case EnvironmentMode.staging:
      case EnvironmentMode.production:
        return 'locales/translations/';
    }
  }
}
