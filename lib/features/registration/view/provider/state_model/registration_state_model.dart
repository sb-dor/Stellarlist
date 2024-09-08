import 'package:firebase_auth/firebase_auth.dart';

enum LetsGetStartedState { showRegistrationButtons, showEmailRegistration }

class RegistrationStateModel {
  User? user;
  LetsGetStartedState letsGetStartedState;

  RegistrationStateModel({
    this.user,
    this.letsGetStartedState = LetsGetStartedState.showRegistrationButtons,
  });

  RegistrationStateModel clone({
    User? user,
    LetsGetStartedState? letsGetStartedState,
  }) =>
      RegistrationStateModel(
        user: user ?? this.user,
        letsGetStartedState: letsGetStartedState ?? this.letsGetStartedState,
      );
}
