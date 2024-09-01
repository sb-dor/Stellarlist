import 'package:stellarlist/core/domain/entities/user_entity.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';

class RegistrationRepoImpl implements RegistrationRepo {
  @override
  Future<UserEntity?> email() {
    // TODO: implement email
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> facebook() {
    // TODO: implement facebook
    throw UnimplementedError();
  }

  @override
  Future<UserEntity?> google() {
    // TODO: implement google
    throw UnimplementedError();
  }
}
