import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/task_list_model/task_list_model.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:stellarlist/core/utils/typedefs.dart';

part 'section_model.g.dart';

part 'section_model.freezed.dart';

@freezed
class SectionModel extends Section with _$SectionModel {
  factory SectionModel({
    String? id,
    String? title,
    @JsonKey(name: "task_list") List<TaskListModel>? taskLists,
  }) = _SectionModel;

  factory SectionModel.fromJson(Map<String, Object?> json) => _$SectionModelFromJson(json);

  factory SectionModel.fromFirebaseJson(FirebaseMapObject json, {String? remoteId}) {
    List<TaskListModel> taskLists = [];
    if (json.containsKey('task_list')) {
      List<dynamic> tList = json['task_list'] as List;
      taskLists = tList
          .map(
            (el) => TaskListModel.fromFirebaseJson(el as FirebaseMapObject),
          )
          .toList();
    }
    return SectionModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      taskLists: taskLists,
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
