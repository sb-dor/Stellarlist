import 'package:uuid/uuid.dart';

class TaskList {
  final String? id;
  final String? title;

  TaskList({required this.title}) : id = const Uuid().v4();
}
