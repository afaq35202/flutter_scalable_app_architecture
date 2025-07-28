import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/env/app_environment.dart';
import 'main.dart';

/// Development config entry point.
/// Launch with `flutter run --target lib/main_development.dart`.
/// Uses local data.
void main() {
  runApp(ProviderScope(
      overrides: AppEnvironment.getEnvOverrides(),
      child: const MainApp()));
}
