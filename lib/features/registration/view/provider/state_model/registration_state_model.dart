import 'package:firebase_auth/firebase_auth.dart';

enum LetsGetStartedState { showRegistrationButtons, showEmailRegistration }

class RegistrationStateModel {
  User? user;
  LetsGetStartedState letsGetStartedState;
  bool continueWithEmailHover;

  RegistrationStateModel({
    this.user,
    this.letsGetStartedState = LetsGetStartedState.showRegistrationButtons,
    this.continueWithEmailHover = false,
  });

  RegistrationStateModel clone({
    User? user,
    LetsGetStartedState? letsGetStartedState,
    bool continueWithEmailHover = false,
  }) =>
      RegistrationStateModel(
        user: user ?? this.user,
        letsGetStartedState: letsGetStartedState ?? this.letsGetStartedState,
        continueWithEmailHover: continueWithEmailHover,
      );
}
