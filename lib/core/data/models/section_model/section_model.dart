import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/section/section.dart';

part 'section_model.g.dart';

part 'section_model.freezed.dart';

@freezed
class SectionModel extends Section with _$SectionModel {
  factory SectionModel({
    String? id,
    String? title,
    List<TaskModel>? tasks,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, Object?> json) => _$SectionModelFromJson(json);
}
