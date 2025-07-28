import 'package:dobby/app/env/app_environment.dart';

class Env {
  static bool _initialized = false;

  static late final String baseUrl;

  static void initialize() {
    if (_initialized) return;
    _initialized = true;

    const env = String.fromEnvironment('ENV', defaultValue: 'dev');

    switch (env) {
      case 'prod':
        _production(EnvironmentMode.production);
        break;
      case 'staging':
        _staging(EnvironmentMode.staging);
        break;
      case 'dev':
        _development(EnvironmentMode.development);
        break;
    }
  }

  static void _production(EnvironmentMode mode) {
    AppEnvironment.currentEnv = mode;
    baseUrl = 'https://uat.apis.hermelin.yellowrock.io/';
  }

  static void _staging(EnvironmentMode mode) {
    AppEnvironment.currentEnv = mode;
    baseUrl = 'https://staging-api.example.com';
  }

  static void _development(EnvironmentMode mode) {
    AppEnvironment.currentEnv = mode;
    baseUrl = 'https://dev-api.example.com';
  }
}
