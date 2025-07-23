import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'main.dart';
import 'package:flutter/material.dart';

/// Staging config entry point.
/// Launch with `flutter run --target lib/main_staging.dart`.
/// Uses remote data from a server.
void main() {
  runApp(ProviderScope(child: const MainApp()));
}
