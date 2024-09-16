import 'package:stellarlist/core/domain/entities/assignee/assignee.dart';
import 'package:stellarlist/core/domain/entities/label/label.dart';
import 'package:stellarlist/core/domain/entities/task/task.dart';
import 'package:uuid/uuid.dart';

base class Section {
  final String id;
  final String? title;
  final List<Task>? tasks;

  Section({
    this.title,
    this.tasks,
  }) : id = const Uuid().v4();
}
