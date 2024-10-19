import 'package:uuid/uuid.dart';

class TaskList {
  final String? id;
  final String? title;

  TaskList({this.title = "New Task"}) : id = const Uuid().v4();
}
