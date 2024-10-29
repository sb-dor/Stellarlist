import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/core/services/auth_services/auth_service.dart';
import 'package:stellarlist/core/services/shared_preferences/shared_prefer.dart';
import 'google_env.dart';

class GoogleAuthService implements AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: GoogleEnv.id,
  );

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SharedPref _sharedPref = getIt<SharedPref>();

  // user if from firebase user
  @override
  Future<User?> auth({AuthData? authData}) async {
    try {
      // if (kIsWeb) {
      //   await _webAuth(authData: authData);
      // } else {
      GoogleSignInAccount? googleUser;

      // if (kIsWeb) {
      //   googleUser = await _googleSignIn.signInSilently();
      // } else {
      googleUser = await _googleSignIn.signIn();
      // }

      // If the user cancels the sign-in process, return
      if (googleUser == null) return null;

      // Get Google authentication object
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      debugPrint("google auth: $googleUser");

      // Save access token to shared preferences
      if (googleAuth.accessToken != null) {
        await _sharedPref.saveString(
          key: "google_auth_access_token",
          value: googleAuth.accessToken!,
        );
      }

      // Save ID token to shared preferences
      if (googleAuth.idToken != null) {
        await _sharedPref.saveString(
          key: "google_auth_id_token",
          value: googleAuth.idToken!,
        );
      }

      // Create a new credential using the tokens
      final OAuthCredential googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the new credential
      await _firebaseAuth.signInWithCredential(googleAuthCredential);
      // }

      final data = _firebaseAuth.currentUser;

      debugPrint("user unique id: ${data?.uid}");

      return data;
    } catch (e) {
      // Print any errors that occur
      debugPrint("error is $e");
      return null;
    }
  }

  Future<void> _webAuth({AuthData? authData}) async {
    GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();

    googleAuthProvider.addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleAuthProvider.setCustomParameters({
      "login_hint": authData?.email,
    });

    _firebaseAuth.signInWithPopup(googleAuthProvider);
  }

  @override
  Future<User?> checkAuth({AuthData? authData}) async {
    try {
      // Get access token from shared preferences
      String? accessToken = _sharedPref.getStringByKey(
        key: 'google_auth_access_token',
      );

      // Get ID token from shared preferences
      String? idToken = _sharedPref.getStringByKey(
        key: 'google_auth_id_token',
      );

      // Create a new credential using the tokens
      OAuthCredential credential = GoogleAuthProvider.credential(
        accessToken: accessToken,
        idToken: idToken,
      );

      // Sign in to Firebase with the new credential
      await _firebaseAuth.signInWithCredential(credential);

      final data = _firebaseAuth.currentUser;

      debugPrint("sign in with cred data: ${data}");

      return data;
    } catch (e) {
      debugPrint("check google auth error is $e");
      return await refreshToken();
    }
  }

  // Refresh authentication token
  Future<User?> refreshToken() async {
    // If the user is currently signed in
    if (_firebaseAuth.currentUser != null) {
      try {
        // Try to silently sign in with Google
        final GoogleSignInAccount? googleUser = await _googleSignIn.signInSilently();

        // If the user cancels the sign-in process, return
        if (googleUser == null) return null;

        // Get Google authentication object
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Save access token to shared preferences
        await _sharedPref.saveString(
          key: "google_auth_access_token",
          value: googleAuth.accessToken!,
        );

        // Save ID token to shared preferences
        await _sharedPref.saveString(
          key: "google_auth_id_token",
          value: googleAuth.idToken!,
        );

        final data = _firebaseAuth.currentUser;

        return data;
      } catch (e) {
        // Print any errors that occur
        debugPrint("error is $e");
        return null;
      }
    } else {
      return null;
    }
  }
}
