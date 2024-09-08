import 'package:get_it/get_it.dart';
import 'package:stellarlist/injections/auth_service_injections/auth_service_injections.dart';
import 'package:stellarlist/injections/registration_injections/registration_injections.dart';
import 'package:stellarlist/services/shared_preferences/shared_prefer.dart';

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
