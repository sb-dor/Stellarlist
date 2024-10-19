import 'package:uuid/uuid.dart';

class Label {
  final String? id;

  Label() : id = const Uuid().v4();
}
