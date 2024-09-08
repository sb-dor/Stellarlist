import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

@immutable
class AuthData {
  final String? email;
  final String? password;

  const AuthData({this.email, this.password});
}

abstract interface class AuthService {

  Future<User?> auth({AuthData? authData});

}
