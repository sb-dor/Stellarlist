import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:get_it/get_it.dart';
import 'package:stellarlist/core/injections/home_injections/home_injections.dart';
import 'package:stellarlist/core/services/analytics/firebase_analytics_reporter.dart';
import 'package:stellarlist/core/services/logger_service/logger_service.dart';
import 'package:stellarlist/core/services/shared_preferences/shared_prefer.dart';
import 'auth_service_injections/auth_service_injections.dart';
import 'registration_injections/registration_injections.dart';

final getIt = GetIt.instance;

abstract class Injections {
  static Future<void> inject() async {
    //
    getIt.registerLazySingleton<SharedPref>(
      () => SharedPref(),
    );

    // simple singleton that will be used
    // for fastly logging to analytics
    // if you want to not use that and to log with your own logger
    // create new object of firebase Analyctincs reporter wherever you want to yse
    final firebaseAnalytics = FirebaseAnalyticsReporter(
      logger: logger,
      analytics: FirebaseAnalytics.instance,
    );

    getIt.registerLazySingleton(() => firebaseAnalytics);

    await getIt<SharedPref>().initPref();

    await AuthServiceInjections.inject();

    await RegistrationInjections.inject();

    await HomeInjections.inject();
  }
}
