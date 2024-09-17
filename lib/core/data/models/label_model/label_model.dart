import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/domain/entities/label/label.dart';

part 'label_model.freezed.dart';

part 'label_model.g.dart';

@freezed
 class LabelModel extends Label with _$LabelModel {
  factory LabelModel({
    String? id,
  }) = _LabelModel;

  factory LabelModel.fromJson(Map<String, Object?> json) => _$LabelModelFromJson(json);
}
