import 'package:get_it/get_it.dart';
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

    await getIt<SharedPref>().initPref();

    await AuthServiceInjections.inject();

    await RegistrationInjections.inject();
  }
}
