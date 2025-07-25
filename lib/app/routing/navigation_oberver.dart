import 'package:dobby/core/utils/logger.dart';
import 'package:flutter/cupertino.dart';

class LoggingObserver extends NavigatorObserver {
  final _logger = Logger("LoggingObserver");

  @override
  void didPush(Route route, Route? previousRoute) {
    super.didPush(route, previousRoute);
    _logger.logInfo(
      functionName: "didPush",
      message: '➡️ Pushed route: ${route.settings.name ?? route.settings}',
    );
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _logger.logInfo(
      functionName: "didReplace",
      message: '🔁 Replaced route: ${newRoute?.settings.name ?? newRoute}',
    );
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    super.didPop(route, previousRoute);
    _logger.logInfo(
      functionName: "didPop",
      message: '⬅️ Popped route: ${route.settings.name ?? route}',
    );
  }
}
