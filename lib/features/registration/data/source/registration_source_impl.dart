import 'package:stellarlist/core/data/models/user_model.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/google_auth_service/google_auth_service.dart';

class RegistrationSourceImpl implements RegistrationSource {
  final GoogleAuthService _googleAuthService = getIt<GoogleAuthService>();

  @override
  Future<UserModel?> email() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> facebook() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<UserModel?> google() async {
    await _googleAuthService.signInWithGoogle();
    return null;
  }
}
