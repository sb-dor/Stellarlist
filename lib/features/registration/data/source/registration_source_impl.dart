import 'package:firebase_auth/firebase_auth.dart';
import 'package:stellarlist/features/registration/data/source/registration_source.dart';
import 'package:stellarlist/injections/auth_service_injections/auth_service_injections.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';
import 'package:stellarlist/services/shared_preferences/shared_prefer.dart';

class RegistrationSourceImpl implements RegistrationSource {
  final SharedPref _sharedPref = getIt<SharedPref>();

  @override
  Future<User?> emailLink({AuthData? authData}) async {
    await _sharedPref.saveString(key: 'auth_type', value: AuthServiceType.emailLink.name);
    return await getIt<AuthService>(instanceName: AuthServiceType.emailLink.name)
        .auth(authData: authData);
  }

  @override
  Future<User?> facebook() async {
    await _sharedPref.saveString(key: 'auth_type', value: AuthServiceType.facebook.name);
    return await getIt<AuthService>(instanceName: AuthServiceType.facebook.name).auth();
  }

  @override
  Future<User?> google() async {
    await _sharedPref.saveString(key: 'auth_type', value: AuthServiceType.google.name);
    return await getIt<AuthService>(instanceName: AuthServiceType.google.name).auth();
  }

  @override
  Future<User?> checkAuth() async {
    final String? authType = _sharedPref.getStringByKey(key: 'auth_type');
    if (authType == AuthServiceType.google.name) {
      // Handle Google auth
      return await getIt<AuthService>(instanceName: AuthServiceType.google.name).auth();
    } else if (authType == AuthServiceType.facebook.name) {
      // Handle Facebook auth
      return await getIt<AuthService>(instanceName: AuthServiceType.facebook.name).auth();
    } else if (authType == AuthServiceType.emailLink.name) {
      // Handle Email auth
    }
    return null;
  }
}
