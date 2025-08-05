import 'package:dobby/core/provider/global_providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/env/environment.dart';

class AppInitializer {
  // Private named constructor
  AppInitializer._internal();

  // The single instance of AppFactory
  static final AppInitializer instance = AppInitializer._internal();

  void initializeProject() {
    _initEnvironment();
  }

  void _initEnvironment() {
    EnvManager.initialize();
  }

  void initializeApp(BuildContext context) {
    GlobalProviders.instance.setContainer(
      ProviderScope.containerOf(context, listen: false),
    );
  }
}
