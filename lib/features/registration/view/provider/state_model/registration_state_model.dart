import 'package:firebase_auth/firebase_auth.dart';

enum LetsGetStartedState { showRegistrationButtons, showEmailRegistration }

class RegistrationStateModel {
  User? user;
  LetsGetStartedState letsGetStartedState;
  String? sentEmail;

  RegistrationStateModel({
    this.user,
    this.letsGetStartedState = LetsGetStartedState.showRegistrationButtons,
    this.sentEmail,
  });

  RegistrationStateModel clone({
    User? user,
    LetsGetStartedState? letsGetStartedState,
    String? sentEmail,
  }) =>
      RegistrationStateModel(
        user: user ?? this.user,
        letsGetStartedState: letsGetStartedState ?? this.letsGetStartedState,
        sentEmail: sentEmail ?? this.sentEmail,
      );
}
