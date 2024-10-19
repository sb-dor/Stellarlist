import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/assignee_model/assignee_model.dart';
import 'package:stellarlist/core/data/models/label_model/label_model.dart';
import 'package:stellarlist/core/data/models/section_model/section_model.dart';
import 'package:stellarlist/core/domain/entities/task.dart';

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
  }) = _TaskModel;

  factory TaskModel.fromJson(Map<String, Object?> json) => _$TaskModelFromJson(json);

  static TaskModel? fromEntity(Task? task) {
    if (task == null) return null;
    return TaskModel(
      id: task.id,
      title: task.title,
      section: SectionModel.fromEntity(task.section),
      assignee: AssigneeModel.fromEntity(task.assignee),
      label: LabelModel.fromEntity(task.label),
    );
  }
}
