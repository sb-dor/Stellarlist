import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:uuid/uuid.dart';

class TaskList {
  final String? id;
  final String? title;
  final List<Task>? tasks;

  TaskList({this.title = "New Task", this.tasks = const []}) : id = const Uuid().v4();
}
