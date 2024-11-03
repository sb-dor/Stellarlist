import 'dart:async';
import 'package:stellarlist/core/services/logger_service/logger_service.dart';
import 'package:stellarlist/features/initialization/logic/app_runner.dart';

void main() {
  runZonedGuarded(
    () => const AppRunner().initApp(),
    logger.logZoneError,
  );
}
