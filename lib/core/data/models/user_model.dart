import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/domain/entities/user_entity.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

@freezed
class UserModel extends UserEntity with _$UserModel {
  const factory UserModel({
    String? id,
    String? name,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, Object?> json) => _$UserModelFromJson(json);
}
