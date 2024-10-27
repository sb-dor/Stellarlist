import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/domain/entities/task.dart';

class TaskWidget extends ConsumerStatefulWidget {
  final Task? task;

  const TaskWidget({
    super.key,
    required this.task,
  });

  @override
  ConsumerState createState() => _TaskWidgetState();
}

class _TaskWidgetState extends ConsumerState<TaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
