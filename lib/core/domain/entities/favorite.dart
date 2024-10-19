import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';

// favorite will have section (which has taskList in it) or taskList (which has tasks in it)
class Favorite {
  final Section? section;
  final TaskList? taskList;

  Favorite({
    required this.section,
    required this.taskList,
  });
}
