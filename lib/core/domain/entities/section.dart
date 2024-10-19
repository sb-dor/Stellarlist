import 'package:stellarlist/core/domain/entities/assignee.dart';
import 'package:stellarlist/core/domain/entities/label.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:uuid/uuid.dart';

 class Section {
  final String? id;
  final String? title;
  final List<TaskList>? taskLists;

  Section({
    this.title = "New Section",
    this.taskLists = const [],
  }) : id = const Uuid().v4();
}
