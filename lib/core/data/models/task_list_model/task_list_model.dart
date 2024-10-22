import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:stellarlist/core/data/models/task_model/task_model.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';

part 'task_list_model.g.dart';

part 'task_list_model.freezed.dart';

@freezed
class TaskListModel extends TaskList with _$TaskListModel {
  factory TaskListModel({
    String? id,
    String? title,
    List<TaskModel>? tasks,
  }) = _TaskListModel;

  factory TaskListModel.fromJson(Map<String, Object?> json) => _$TaskListModelFromJson(json);

  factory TaskListModel.fromFirebaseJson(Map<Object?, Object?> json, {String? remoteId}) {
    List<TaskModel> tasks = [];
    if (json.containsKey('tasks')) {
      List<dynamic> tasksD = json['tasks'] as List;
      tasks = tasksD.map((e) => TaskModel.fromFirebaseJson(e as Map<Object?, Object?>)).toList();
    }
    return TaskListModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      tasks: tasks,
    );
  }

  static TaskListModel? fromEntity(TaskList? taskList) {
    if (taskList == null) return null;
    return TaskListModel(
      id: taskList.id,
      title: taskList.title,
      tasks: taskList.tasks?.map((el) => TaskModel.fromEntity(el)!).toList(),
    );
  }
}
