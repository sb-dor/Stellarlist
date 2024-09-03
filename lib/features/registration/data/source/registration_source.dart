import 'package:firebase_auth/firebase_auth.dart';

abstract interface class RegistrationSource {
  Future<User?> google();

  Future<User?> facebook();

  Future<User?> email();
}
