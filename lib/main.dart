import 'package:flutter/material.dart';
import 'app/app_factory.dart';
import 'app/routing/router.dart';
import 'app/theming/theme/theme.dart';
import 'l10n/app_localizations.dart';
import 'main_development.dart' as development;

///create release apk for each environment
// flutter build apk --release --dart-define=ENV=dev
// flutter build apk --release --dart-define=ENV=staging
// flutter build apk --release --dart-define=ENV=prod
///create bundle
// flutter build appbundle --release --dart-define=ENV=prod

/// Default main method
void main() {
  // Launch development config by default
  AppFactory.instance.initializeProject();
  development.main();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppFactory.instance.initializeApp(context);
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: router,
    );
  }
}
