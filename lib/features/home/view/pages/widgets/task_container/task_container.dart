import 'package:flutter/material.dart';
import 'package:stellarlist/core/utils/app_colors.dart';

class TaskContainer extends StatefulWidget {
  const TaskContainer({super.key});

  @override
  State<TaskContainer> createState() => _TaskContainerState();
}

class _TaskContainerState extends State<TaskContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 15, bottom: 15),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(15),
      ),
    );
  }
}
