import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/assignee_model/assignee_model.dart';
import 'package:stellarlist/core/data/models/label_model/label_model.dart';
import 'package:stellarlist/core/data/models/section_model/section_model.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/utils/typedefs.dart';

part 'task_model.freezed.dart';

part 'task_model.g.dart';

@freezed
class TaskModel extends Task with _$TaskModel {
  factory TaskModel({
    String? id,
    String? title,
    SectionModel? section,
    AssigneeModel? assignee,
    LabelModel? label,
    List<TaskModel>? subtasks,
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) => _$TaskModelFromJson(json);

  factory TaskModel.fromFirebaseJson(FirebaseMapObject json, {String? remoteId}) {
    List<TaskModel> subtasks = [];
    if (json.containsKey('subtasks')) {
      List<dynamic> sData = json['subtasks'] as List;
      subtasks = sData.map((el) => TaskModel.fromFirebaseJson(el as FirebaseMapObject)).toList();
    }

    return TaskModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      section: json['section'] == null
          ? null
          : SectionModel.fromFirebaseJson(json['section'] as FirebaseMapObject),
      assignee: json['assignee'] == null
          ? null
          : AssigneeModel.fromFirebaseJson(json['assignee'] as FirebaseMapObject),
      label: json['label'] == null
          ? null
          : LabelModel.fromFirebaseJson(json['label'] as FirebaseMapObject),
      subtasks: subtasks,
    );
  }

  static TaskModel? fromEntity(Task? task) {
    if (task == null) return null;
    return TaskModel(
      id: task.id,
      title: task.title,
      section: SectionModel.fromEntity(task.section),
      assignee: AssigneeModel.fromEntity(task.assignee),
      label: LabelModel.fromEntity(task.label),
      subtasks: task.subtasks?.map((el) => TaskModel.fromEntity(el)!).toList(),
    );
  }
}
