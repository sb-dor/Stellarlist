import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/domain/usecases/registration_usecase.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';
import 'package:stellarlist/services/auth_services/auth_service.dart';

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

  Future<void> googleAuth(RegistrationRepo repo) async {
    final user = await RegistrationUseCase(repo).google();
    state = state?.clone(user: user);
  }

  Future<void> emailLink(RegistrationRepo repo, {AuthData? authData}) async {
    final user = await RegistrationUseCase(repo).emailLink(authData: authData);
    state = state?.clone(user: user);
  }
}
