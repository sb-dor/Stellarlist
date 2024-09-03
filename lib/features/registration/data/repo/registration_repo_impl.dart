import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  final RegistrationSource _registrationSource;

  RegistrationRepoImpl(this._registrationSource);

  @override
  Future<User?> email() {
    // TODO: implement email
    throw UnimplementedError();
  }

  @override
  Future<User?> facebook() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<User?> google() => _registrationSource.google();
}
