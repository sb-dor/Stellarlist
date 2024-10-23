import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/core/animations/slide_animation.dart';
import 'package:stellarlist/core/domain/entities/task.dart';
import 'package:stellarlist/core/domain/entities/task_list.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/utils/constants.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';

class TaskContainer extends ConsumerStatefulWidget {
  final TaskList? taskList;
  final Task? task;
  final bool firstWidget;

  const TaskContainer({
    super.key,
    this.taskList,
    this.task,
    required this.firstWidget,
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
          ? _FirstContainer(
              taskList: widget.taskList,
            )
          : _SecondContainer(
              task: widget.task,
            ),
    );
  }
}

// rename in the future
class _FirstContainer extends StatefulWidget {
  final TaskList? taskList;

  const _FirstContainer({super.key, required this.taskList});

  @override
  State<_FirstContainer> createState() => _FirstContainerState();
}

class _FirstContainerState extends State<_FirstContainer> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            children: [
              ElevatedButton(
                style: ButtonStyle(
                  shape: const WidgetStatePropertyAll(
                    StadiumBorder(),
                  ),
                  padding: const WidgetStatePropertyAll(
                    EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                  ),
                  elevation: const WidgetStatePropertyAll(0.0),
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.buttonBackgroundColor,
                  ),
                  overlayColor: const WidgetStatePropertyAll(
                    Colors.white,
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Share",
                  style: GoogleFonts.inter(color: Colors.grey),
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text("This list is private"),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.star_border_rounded),
              ),
              const SizedBox(width: 10),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.more_vert),
              ),
            ],
          )
        ],
      ),
    );
  }
}

// rename in the future
class _SecondContainer extends StatelessWidget {
  final Task? task;

  const _SecondContainer({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
