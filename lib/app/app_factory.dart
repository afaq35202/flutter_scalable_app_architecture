import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../app/env/environment.dart';

class AppFactory {
  late ProviderContainer globalProviderContainer;

  // Private named constructor
  AppFactory._internal();

  // The single instance of AppFactory
  static final AppFactory instance = AppFactory._internal();

  void initializeProject() {
    _initEnvironment();
  }

  void _initEnvironment() {
    EnvManager.initialize();
  }

  void initializeApp(BuildContext context) {
    _initGlobalProvider(context);
  }

  void _initGlobalProvider(BuildContext context) {
    globalProviderContainer = ProviderScope.containerOf(context, listen: false);
  }
}
