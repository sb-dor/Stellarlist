import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:stellarlist/core/domain/entities/user_entity.dart';

part 'registration_provider.g.dart';

@Riverpod(keepAlive: true)
class RegistrationProvider extends _$RegistrationProvider {
  @override
  Future<UserEntity?> build() async {
    return null;
  }
}
