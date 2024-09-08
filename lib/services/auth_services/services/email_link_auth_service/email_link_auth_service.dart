import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';
import 'package:stellarlist/services/auth_services/services/email_link_auth_service/email_link_auth_env.dart';

// https://medium.com/@akhilaand/passwordless-email-sign-in-using-flutter-and-firebase-dynamic-link-ace3906c70a7

// https://github.com/akhilannd/passwordelessSignIn
class EmailLinkAuthService implements AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<User?> auth({AuthData? authData}) async {
    debugPrint("coming email: ${authData?.email}");
    final settings = ActionCodeSettings(
      url: EmailLinkAuthEnv.url,
      iOSBundleId: 'com.bdaynabday.stellarlist',
      androidPackageName: 'com.bdaynabday.stellarlist',
      androidInstallApp: true,
      androidMinimumVersion: '1',
      handleCodeInApp: true,
    );

    await _firebaseAuth.sendSignInLinkToEmail(
      email: authData?.email ?? '',
      actionCodeSettings: settings,
    );

    // check this every three seconds in the future
    if (_firebaseAuth.isSignInWithEmailLink(authData?.email ?? '')) {
      debugPrint("sign up with email link");
    }
    return null;
  }
}
