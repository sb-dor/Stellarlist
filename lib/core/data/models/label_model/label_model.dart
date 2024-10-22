import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/domain/entities/label.dart';

part 'label_model.freezed.dart';

part 'label_model.g.dart';

@freezed
class LabelModel extends Label with _$LabelModel {
  factory LabelModel({
    String? id,
  }) = _LabelModel;

  factory LabelModel.fromJson(Map<String, Object?> json) => _$LabelModelFromJson(json);

  factory LabelModel.fromFirebaseJson(Map<Object?, Object?> json) {
    return LabelModel(
      id: json['id'] as String?,
    );
  }

  static LabelModel? fromEntity(Label? label) {
    if (label == null) return null;
    return LabelModel(
      id: label.id,
    );
  }
}
