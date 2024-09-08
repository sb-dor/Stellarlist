import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';
import 'package:stellarlist/services/shared_preferences/shared_prefer.dart';
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
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

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

      final data = _firebaseAuth.currentUser;

      debugPrint("user unique id: ${data?.uid}");

      return data;
    } catch (e) {
      // Print any errors that occur
      debugPrint("error is $e");
      return null;
    }
  }
}
