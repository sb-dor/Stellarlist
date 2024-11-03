import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/injections/injections.dart';
import 'package:stellarlist/core/services/analytics/analytics_reporter.dart';
import 'package:stellarlist/core/services/analytics/firebase_analytics_reporter.dart';
import 'package:stellarlist/core/services/analytics/firebase_analytics_reporter_event_constants.dart';
import 'package:stellarlist/core/services/auth_services/auth_service.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/domain/usecases/registration_usecase.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';

part 'registration_provider.g.dart';

@Riverpod(keepAlive: true)
class RegistrationProvider extends _$RegistrationProvider {
  @override
  RegistrationStateModel? build() {
    return RegistrationStateModel();
  }

  void changeStateInEmailRegistration(LetsGetStartedState getStartedState) {
    state = state?.clone(
      letsGetStartedState: getStartedState,
    );
  }

  Future<void> checkAuth(RegistrationRepo repo) async {
    final user = await RegistrationUseCase(repo).checkAuth();
    state = state?.clone(user: user);
  }

  Future<bool> googleAuth(RegistrationRepo repo) async {
    getIt<FirebaseAnalyticsReporter>().logEvent(
      const AnalyticsEvent(FirebaseAnalyticsReporterEventConstants.googleRegistration),
    );
    final user = await RegistrationUseCase(repo).google();
    state = state?.clone(user: user);
    if (user != null) return true;
    return false;
  }

  Future<bool> facebookAuth(RegistrationRepo repo) async {
    getIt<FirebaseAnalyticsReporter>().logEvent(
      const AnalyticsEvent(FirebaseAnalyticsReporterEventConstants.facebookRegistration),
    );
    final user = await RegistrationUseCase(repo).facebook();
    state = state?.clone(user: user);
    if (user != null) return true;
    return false;
  }

  Future<void> emailLink(RegistrationRepo repo, {AuthData? authData}) async {
    getIt<FirebaseAnalyticsReporter>().logEvent(
      const AnalyticsEvent(FirebaseAnalyticsReporterEventConstants.emailRegistration),
    );
    state = state?.clone(sentEmail: authData?.email);
    final user = await RegistrationUseCase(repo).emailLink(authData: authData);
    state = state?.clone(user: user);
  }
}
