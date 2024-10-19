import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/utils/constants.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';

class TaskContainer extends ConsumerStatefulWidget {
  final bool firstWidget;

  const TaskContainer({
    super.key,
    required this.firstWidget,
  });

  @override
  ConsumerState createState() => _TaskContainerState();
}

class _TaskContainerState extends ConsumerState<TaskContainer> {
  double width = 300;

  @override
  Widget build(BuildContext context) {
    final mediaQueryWidth = MediaQuery.of(context).size.width;
    final animatedSideBarProvider = ref.watch(animatedSidebarProviderProvider);
    return Align(
      alignment: Alignment.centerLeft,
      child: AnimatedContainer(
        duration: widget.firstWidget ? const Duration(milliseconds: 300) : Duration.zero,
        transformAlignment: Alignment.centerRight,
        width: (animatedSideBarProvider.stuck ?? false)
            ? widget.firstWidget
                ? (mediaQueryWidth - Constants.appBarStuckWidth) * 0.53
                : (mediaQueryWidth - Constants.appBarStuckWidth) * 0.430
            : widget.firstWidget
                ? mediaQueryWidth * 0.53
                : mediaQueryWidth * 0.435,
        margin: const EdgeInsets.only(
          left: 15,
          top: 15,
          bottom: 15,
        ),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
