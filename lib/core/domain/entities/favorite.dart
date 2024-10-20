import 'package:stellarlist/core/domain/entities/section.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:uuid/uuid.dart';

// favorite will have section (which has taskList in it) or taskList (which has tasks in it)
class Favorite {
  final String? id;
  final String? userId;
  final Section? section;
  final TaskList? taskList;

  Favorite({
    required this.id,
    required this.userId,
    required this.section,
    required this.taskList,
  });
}
