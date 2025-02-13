import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:stellarlist/core/services/logger_service/logger_service.dart';

import 'analytics_reporter.dart';

/// [NOTE] : is using from
/// https://github.com/hawkkiller/sizzle_starter

/// {@template firebase_analytics_reporter}
/// An implementation of [AnalyticsReporter] that reports events to Firebase
/// Analytics.
/// {@endtemplate}
final class FirebaseAnalyticsReporter implements AnalyticsReporter {
  /// {@macro firebase_analytics_reporter}
  const FirebaseAnalyticsReporter({
    required this.logger,
    required this.analytics,
  });

  /// The logger used to log events locally for debugging.
  final RefinedLogger logger;

  /// The Firebase Analytics instance used to log events.
  final FirebaseAnalytics analytics;

  /// make it singleton | own implementation

  @override
  Future<void> logEvent(AnalyticsEvent event) async {
    logger.trace('Logging analytics event: $event');

    final parameters = event.parameters?.map(
      (parameter) => MapEntry(parameter.name, parameter.value),
    );

    await analytics.logEvent(
      name: event.name,
      parameters: parameters != null ? Map.fromEntries(parameters) : null,
    );
  }
}
