import 'package:flutter/foundation.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';

@immutable
class SelectedTaskList {
  final TaskList? taskList;
  final List<Task>? tasks;

  const SelectedTaskList({
    required this.taskList,
    required this.tasks,
  });
}
