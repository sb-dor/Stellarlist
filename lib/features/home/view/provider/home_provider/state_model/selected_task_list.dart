import 'package:flutter/foundation.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';

class SelectedTaskList {
  TaskList? taskList;
  List<Task>? tasks;

  SelectedTaskList({
    this.taskList,
    this.tasks,
  });

  SelectedTaskList copyWith({
    TaskList? taskList,
    List<Task>? tasks,
  }) =>
      SelectedTaskList(
        taskList: taskList ?? this.taskList,
        tasks: tasks ?? this.tasks,
      );

  int get length => taskList != null && tasks != null && tasks!.isNotEmpty ? tasks!.length + 1 : 0;
}
