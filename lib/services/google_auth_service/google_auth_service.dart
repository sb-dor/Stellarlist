import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stellarlist/injections/injections.dart';
import 'package:stellarlist/services/google_auth_service/google_env.dart';
import 'package:stellarlist/services/shared_preferences/shared_prefer.dart';

class GoogleAuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: GoogleEnv.id,
  );

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final SharedPref _sharedPref = getIt<SharedPref>();

  Future<GoogleSignInAccount?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If the user cancels the sign-in process, return
      if (googleUser == null) return null;

      // Get Google authentication object
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      debugPrint("google auth: ${googleUser}");

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

      return googleUser;
    } catch (e) {
      // Print any errors that occur
      debugPrint("error is $e");
      return null;
    }
  }
}
