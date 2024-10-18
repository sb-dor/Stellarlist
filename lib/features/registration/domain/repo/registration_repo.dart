import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/core/services/auth_services/auth_service.dart';

abstract interface class RegistrationRepo {
  Future<User?> google();

  Future<User?> facebook();

  Future<User?> emailLink({AuthData? authData});

  Future<User?> checkAuth();
}
