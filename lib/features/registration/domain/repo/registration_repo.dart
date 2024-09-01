import 'package:stellarlist/core/domain/entities/user_entity.dart';

abstract interface class RegistrationRepo {
  Future<UserEntity?> google();

  Future<UserEntity?> facebook();

  Future<UserEntity?> email();
}
