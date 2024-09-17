import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';

class RegistrationUseCase {
  final RegistrationRepo _registrationRepo;

  RegistrationUseCase(this._registrationRepo);

  Future<User?> google() => _registrationRepo.google();

  Future<User?> facebook() => _registrationRepo.facebook();

  Future<User?> emailLink({AuthData? authData}) => _registrationRepo.emailLink(authData: authData);

  Future<User?> checkAuth() => _registrationRepo.checkAuth();
}
