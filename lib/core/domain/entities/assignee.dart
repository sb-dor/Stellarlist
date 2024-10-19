import 'package:uuid/uuid.dart';

 class Assignee {
  final String? id;

  Assignee() : id = const Uuid().v4();
}
