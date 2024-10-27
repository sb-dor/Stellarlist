import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/core/animations/slide_animation.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/utils/constants.dart';
import 'package:stellarlist/core/widgets/editor_helper.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';
import 'package:stellarlist/features/home/view/pages/widgets/task_container/widget/container_task_widget.dart';
import 'package:stellarlist/features/home/view/provider/home_provider/home_provider.dart';

import 'widget/container_tasklist_widget.dart';

class TaskContainer extends ConsumerStatefulWidget {
  final bool firstWidget;
  final TaskList? taskList;
  final Task? task;

  const TaskContainer({
    super.key,
    required this.firstWidget,
    this.taskList,
    this.task,
  });

  @override
  ConsumerState createState() => _TaskContainerState();
}

class _TaskContainerState extends ConsumerState<TaskContainer> {
  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final animatedSideBarProvider = ref.watch(animatedSidebarProviderProvider);
    return AnimatedContainer(
      duration: widget.firstWidget ? const Duration(milliseconds: 300) : Duration.zero,
      transformAlignment: Alignment.centerRight,
      width: ResponsiveValue<double?>(
        context,
        conditionalValues: [
          Condition.smallerThan(
            name: DESKTOP,
            value: (animatedSideBarProvider.stuck ?? false)
                ? (mediaQueryWidth - Constants.appBarStuckWidth) * 0.94
                : mediaQueryWidth * 0.96,
          ),
          Condition.largerThan(
            name: TABLET,
            value: (animatedSideBarProvider.stuck ?? false)
                ? widget.firstWidget
                    ? (mediaQueryWidth - Constants.appBarStuckWidth) * 0.60
                    : (mediaQueryWidth - Constants.appBarStuckWidth) * 0.40 - 45
                : widget.firstWidget
                    ? mediaQueryWidth * 0.60
                    : mediaQueryWidth * 0.40 - 45,
          ),
        ],
      ).value,
      margin: const EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      decoration: BoxDecoration(
        color: AppColors.containerColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: widget.firstWidget
          ? ContainerTaskListWidget(
              taskList: widget.taskList,
            )
          : ContainerTaskWidget(
              task: widget.task,
            ),
    );
  }
}
