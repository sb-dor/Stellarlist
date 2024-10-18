import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/core/services/auth_services/auth_service.dart';
import 'package:stellarlist/core/services/auth_services/services/email_link_auth_service/email_link_auth_service.dart';
import 'package:stellarlist/core/services/auth_services/services/facebook_auth_service/facebook_auth_service.dart';
import 'package:stellarlist/core/services/auth_services/services/google_auth_service/google_auth_service.dart';

enum AuthServiceType { google, emailLink, facebook }

abstract final class AuthServiceInjections {
  static Future<void> inject() async {
    getIt.registerLazySingleton<AuthService>(
      () => GoogleAuthService(),
      instanceName: AuthServiceType.google.name,
    );

    getIt.registerLazySingleton<AuthService>(
      () => FacebookAuthService(),
      instanceName: AuthServiceType.facebook.name,
    );

    getIt.registerLazySingleton<AuthService>(
      () => EmailLinkAuthService(),
      instanceName: AuthServiceType.emailLink.name,
    );
  }
}
