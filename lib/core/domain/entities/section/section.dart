import 'package:stellarlist/core/domain/entities/assignee/assignee.dart';
import 'package:stellarlist/core/domain/entities/label/label.dart';
import 'package:stellarlist/core/domain/entities/task/task.dart';
import 'package:uuid/uuid.dart';

 class Section {
  final String id;
  final String? title;
  final List<Task>? tasks;

  Section({
    required this.title,
    required this.tasks,
  }) : id = const Uuid().v4();
}
