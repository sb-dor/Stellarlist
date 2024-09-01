import 'package:stellarlist/core/data/models/user_model.dart';

abstract interface class RegistrationSource {
  Future<UserModel?> google();

  Future<UserModel?> facebook();

  Future<UserModel?> email();
}
