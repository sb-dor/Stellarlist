import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/section.dart';

part 'section_model.g.dart';

part 'section_model.freezed.dart';

@freezed
class SectionModel extends Section with _$SectionModel {
  factory SectionModel({
    String? id,
    String? title,
    List<TaskListModel>? taskLists,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, Object?> json) => _$SectionModelFromJson(json);

  factory SectionModel.fromFirebaseJson(Map<Object?, Object?> json, {String? remoteId}) {
    return SectionModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
    );
  }

  static SectionModel? fromEntity(Section? section) {
    if (section == null) return null;
    return SectionModel(
      id: section.id,
      title: section.title,
      taskLists: section.taskLists?.map((element) => TaskListModel.fromEntity(element)!).toList(),
    );
  }
}
