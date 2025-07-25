import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class AppFactory {
  late ProviderContainer globalProviderContainer;

  // Private named constructor
  AppFactory._internal();

  // The single instance of AppFactory
  static final AppFactory instance = AppFactory._internal();



  // Example method
  void initialize(BuildContext context) {
    globalProviderContainer = ProviderScope.containerOf(context, listen: false);
  }
}
