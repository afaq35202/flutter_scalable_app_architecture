import 'package:flutter/cupertino.dart';

class Logger {
  final String className;

  const Logger(this.className);

  void logError({
    required String functionName,
    required Object error,
    StackTrace? stackTrace,
  }) {
    final errorLog = '[ERROR] [$className -> $functionName] ❌: $error';
    debugPrint(errorLog);
    if (stackTrace != null) {
      debugPrint('[STACKTRACE]: $stackTrace');
    }
  }

  void logInfo({required String functionName, required String message}) {
    final infoLog = '[INFO] [$className -> $functionName] ℹ️: $message';
    debugPrint(infoLog);
  }

  void logWarning({required String functionName, required String message}) {
    final warnLog = '[WARN] [$className -> $functionName] ⚠️: $message';
    debugPrint(warnLog);
  }
}
