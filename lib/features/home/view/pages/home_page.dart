import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/utils/constants.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/animated_side_bar.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';
import 'package:stellarlist/features/home/view/pages/widgets/task_container/task_container.dart';
import 'package:stellarlist/features/home/view/provider/home_provider/home_provider.dart';

final ItemScrollController itemScrollController = ItemScrollController();

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final animSidebarProvider = ref.watch(animatedSidebarProviderProvider);
    final homeProvider = ref.watch(homeProviderProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 15,
            right: 15,
            child: Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 100),
                  width: (animSidebarProvider.stuck ?? false) ? Constants.appBarStuckWidth : 0,
                ),
                Expanded(
                  child: ScrollablePositionedList.separated(
                    separatorBuilder: (context, index) => const SizedBox(width: 15),
                    itemScrollController: itemScrollController,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: homeProvider.selectedFavorite?.taskList?.tasks?.length ?? 0,
                    // temp
                    itemBuilder: (context, index) {
                      final checkScreenSizeConValue =
                          ResponsiveBreakpoints.of(context).largerThan(TABLET);
                      double alignment = checkScreenSizeConValue
                          ? index == 0
                              ? 0
                              : 0.630
                          : 0;
                      if (index < 1) {
                        return GestureDetector(
                          onTap: () {
                            // for test

                            itemScrollController.scrollTo(
                              index: index,
                              duration: const Duration(milliseconds: 400),
                              alignment: alignment,
                            );
                            ref.read(homeProviderProvider.notifier).changeStartedToScrollTask(true);
                            ref.read(homeProviderProvider.notifier).addCurrentIndex(index);
                          },
                          child: const TaskContainer(firstWidget: true),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            // for test

                            itemScrollController.scrollTo(
                              index: index + 1,
                              duration: const Duration(milliseconds: 400),
                              alignment: alignment,
                            );
                            ref.read(homeProviderProvider.notifier).changeStartedToScrollTask(true);
                            ref.read(homeProviderProvider.notifier).addCurrentIndex(index);
                          },
                          child: const TaskContainer(firstWidget: false),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          AnimatedPositioned(
            bottom: (animSidebarProvider.stuck ?? false) ? 0 : 5,
            left: (animSidebarProvider.stuck ?? false)
                ? 0
                : (animSidebarProvider.closed ?? false)
                    ? -1000
                    : 5,
            top: (animSidebarProvider.stuck ?? false) ? 0 : 5,
            duration: const Duration(milliseconds: 300),
            child: const AnimatedSideBar(),
          ),
          // if ((animSidebarProvider.stuck ?? false))
          Positioned(
            bottom: 0,
            left: 0,
            top: 0,
            child: MouseRegion(
              onHover: (value) {
                if (!(animSidebarProvider.stuck ?? false) &&
                    (animSidebarProvider.closed ?? false)) {
                  ref.read(animatedSidebarProviderProvider.notifier).openCloseSideBar(
                        closed: false,
                        stuck: false,
                      );
                }
              },
              onExit: (value) {},
              child: Container(
                width: 15,
                color: Colors.transparent,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
