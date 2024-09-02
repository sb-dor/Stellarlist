import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/domain/entities/user_entity.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';
import 'package:stellarlist/features/registration/domain/usecases/registration_usecase.dart';

part 'registration_provider.g.dart';

@Riverpod(keepAlive: true)
class RegistrationProvider extends _$RegistrationProvider {
  @override
  Future<UserEntity?> build() async {
    return null;
  }

  Future<void> googleAuth(RegistrationRepo repo) async {
    final result = await RegistrationUseCase(repo).google();
    state = AsyncData<UserEntity?>(result);
  }
}
