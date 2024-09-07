import 'package:riverpod_annotation/riverpod_annotation.dart';
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

  void changeStateToEmailRegistration(LetsGetStartedState getStartedState) {
    state = state?.clone(
      letsGetStartedState: getStartedState,
    );
  }

  Future<void> googleAuth(RegistrationRepo repo) async {
    final user = await RegistrationUseCase(repo).google();
    state = state?.clone(user: user);
  }

  void changeContinueWithEmailHover(bool value) {
    state = state?.clone(continueWithEmailHover: value);
  }
}
