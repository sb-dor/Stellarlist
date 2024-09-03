import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/domain/usecases/registration_usecase.dart';
import 'package:stellarlist/features/registration/view/provider/state_model/registration_state_model.dart';

part 'registration_provider.g.dart';

@Riverpod(keepAlive: true)
class RegistrationProvider extends _$RegistrationProvider {
  @override
  Future<RegistrationStateModel?> build() async {
    return RegistrationStateModel();
  }

  void changeStateToEmailRegistration() {
    state = AsyncData(
      state.value?.clone(
        letsGetStartedState: LetsGetStartedState.showEmailRegistration,
      ),
    );
  }

  Future<void> googleAuth(RegistrationRepo repo) async {
    final user = await RegistrationUseCase(repo).google();
    state = AsyncData(state.value?.clone(user: user));
  }
}
