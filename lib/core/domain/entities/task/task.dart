import 'package:stellarlist/core/domain/entities/assignee/assignee.dart';
import 'package:stellarlist/core/domain/entities/label/label.dart';
import 'package:uuid/uuid.dart';

class Task {
  final String? id;
  final String? title;
  final Assignee? assignee;
  final Label? label;

  Task({
    required this.title,
    required this.assignee,
    required this.label,
  }) : id = const Uuid().v4();
}
