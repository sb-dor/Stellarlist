import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/animated_side_bar.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';
import 'package:stellarlist/features/home/view/pages/widgets/task_container/task_container.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final animSidebarProvider = ref.watch(animatedSidebarProviderProvider);
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Stack(
        children: [
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
          Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: PageView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return TaskContainer();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
