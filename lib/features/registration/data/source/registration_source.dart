import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';

abstract interface class RegistrationSource {
  Future<User?> google();

  Future<User?> facebook();

  Future<User?> emailLink({AuthData? authData});
}
