import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stellarlist/core/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    String? id,
    String? name,
    String? imageUrl,
    String? email,
    String? serverAuthCode,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);

  factory UserModel.fromGoogleSignInAccount(GoogleSignInAccount? googleSignInAccount) => UserModel(
        id: googleSignInAccount?.id,
        name: googleSignInAccount?.displayName,
        imageUrl: googleSignInAccount?.photoUrl,
        email: googleSignInAccount?.email,
        serverAuthCode: googleSignInAccount?.serverAuthCode,
      );
}
