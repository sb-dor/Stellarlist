import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/google_auth_service/google_auth_service.dart';

class RegistrationSourceImpl implements RegistrationSource {
  final GoogleAuthService _googleAuthService = getIt<GoogleAuthService>();

  @override
  Future<User?> email() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<User?> facebook() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<User?> google() async {
    return await _googleAuthService.signInWithGoogle();
  }
}
