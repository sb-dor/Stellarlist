import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';

part 'task_list_model.g.dart';

part 'task_list_model.freezed.dart';

@freezed
class TaskListModel extends TaskList with _$TaskListModel {
  factory TaskListModel({
    String? id,
    String? title,
  }) = _TaskListModel;

  factory TaskListModel.fromJson(Map<String, Object?> json) => _$TaskListModelFromJson(json);

  static TaskListModel? fromEntity(TaskList? taskList) {
    if (taskList == null) return null;
    return TaskListModel(
      id: taskList.id,
      title: taskList.title,
    );
  }
}
