import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/injections/auth_service_injections/auth_service_injections.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';

class RegistrationSourceImpl implements RegistrationSource {
  @override
  Future<User?> emailLink({AuthData? authData}) =>
      getIt<AuthService>(instanceName: AuthServiceType.emailLink.name).auth(authData: authData);

  @override
  Future<User?> facebook() =>
      getIt<AuthService>(instanceName: AuthServiceType.facebook.name).auth();

  @override
  Future<User?> google() => getIt<AuthService>(instanceName: AuthServiceType.google.name).auth();
}
