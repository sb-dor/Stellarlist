import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:uuid/uuid.dart';

class TaskList {
  final String? id;
  final String? title;
  final List<Task>? tasks;

  TaskList({
    required this.id,
    required this.tasks,
    this.title = "New Task",
  });
}
