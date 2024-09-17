import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';

class FacebookAuthService implements AuthService {
  @override
  Future<User?> auth({AuthData? authData}) {
    // TODO: implement auth
    throw UnimplementedError();
  }

  @override
  Future<User?> checkAuth({AuthData? authData}) {
    // TODO: implement checkAuth
    throw UnimplementedError();
  }
}
