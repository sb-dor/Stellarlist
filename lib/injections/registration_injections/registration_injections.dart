import 'package:stellarlist/features/registration/data/repo/registration_repo_impl.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/features/registration/data/source/registration_source_impl.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/injections/injections.dart';

abstract final class RegistrationInjections {
  static Future<void> inject() async {
    getIt.registerLazySingleton<RegistrationSource>(
      () => RegistrationSourceImpl(),
    );

    getIt.registerLazySingleton<RegistrationRepo>(
      () => RegistrationRepoImpl(
        getIt<RegistrationSource>(),
      ),
    );
  }
}
