import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/domain/entities/task.dart';

class ContainerTaskWidget extends ConsumerStatefulWidget {
  final Task? task;

  const ContainerTaskWidget({
    super.key,
    required this.task,
  });

  @override
  ConsumerState createState() => _ContainerTaskWidgetState();
}

class _ContainerTaskWidgetState extends ConsumerState<ContainerTaskWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
