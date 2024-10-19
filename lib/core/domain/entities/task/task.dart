import 'package:stellarlist/core/domain/entities/assignee/assignee.dart';
import 'package:stellarlist/core/domain/entities/label/label.dart';
import 'package:stellarlist/core/domain/entities/section/section.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String? id;
  final String? title;
  final Section? section;
  final Assignee? assignee;
  final Label? label;

  Task({
    required this.title,
    required this.section,
    required this.assignee,
    required this.label,
  }) : id = const Uuid().v4();
}
