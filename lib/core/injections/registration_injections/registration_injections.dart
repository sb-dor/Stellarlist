import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/features/registration/data/repo/registration_repo_impl.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/features/registration/data/source/registration_source_impl.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';

abstract final class RegistrationInjections {
  static Future<void> inject() async {
    // getIt.registerLazySingleton<RegistrationSource>(
    //   () => RegistrationSourceImpl(),
    // );

    RegistrationSource registrationSource = RegistrationSourceImpl();

    getIt.registerLazySingleton<RegistrationRepo>(
      () => RegistrationRepoImpl(
        registrationSource,
      ),
    );
  }
}
