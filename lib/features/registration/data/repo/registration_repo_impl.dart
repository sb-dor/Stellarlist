import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  final RegistrationSource _registrationSource;

  RegistrationRepoImpl(this._registrationSource);

  @override
  Future<User?> emailLink({AuthData? authData}) =>
      _registrationSource.emailLink(authData: authData);

  @override
  Future<User?> facebook() => _registrationSource.facebook();

  @override
  Future<User?> google() => _registrationSource.google();
}
