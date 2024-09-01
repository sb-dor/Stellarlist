import 'package:stellarlist/core/domain/entities/user_entity.dart';
import 'package:stellarlist/features/registration/domain/repo/registration_repo.dart';

class RegistrationUseCase {
  final RegistrationRepo _registrationRepo;

  RegistrationUseCase(this._registrationRepo);

  Future<UserEntity?> google() => _registrationRepo.google();

  Future<UserEntity?> facebook() => _registrationRepo.facebook();

  Future<UserEntity?> email() => _registrationRepo.email();
}
