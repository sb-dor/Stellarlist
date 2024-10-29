import 'package:stellarlist/core/domain/entities/assignee.dart';
import 'package:stellarlist/core/domain/entities/label.dart';
import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String? id;
  final String? title;
  final Section? section;
  final Assignee? assignee;
  final Label? label;
  final bool? isDone;

  final List<Task>? subtasks;

  Task({
    required this.id,
    required this.title,
    required this.section,
    required this.assignee,
    required this.label,
    required this.subtasks,
    required this.isDone,
  });
}
