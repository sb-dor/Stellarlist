import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stellarlist/features/home/view/pages/home_page.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';
import 'package:stellarlist/features/home/view/provider/home_provider.dart';

class AsbTopShowHideWidget extends ConsumerWidget {
  const AsbTopShowHideWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animSidebarProvider = ref.watch(animatedSidebarProviderProvider);
    final homeProvider = ref.watch(homeProviderProvider);
    return Column(
      children: [
        Visibility(
          visible: (animSidebarProvider.hovered ?? false),
          maintainState: true,
          maintainAnimation: true,
          child: SizedBox(
            height: 65,
            child: AnimatedOpacity(
              opacity: (animSidebarProvider.hovered ?? false) ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if ((animSidebarProvider.stuck ?? false)) {
                          ref.read(animatedSidebarProviderProvider.notifier).openCloseSideBar(
                                closed: true,
                                stuck: false,
                              );
                        } else {
                          ref.read(animatedSidebarProviderProvider.notifier).openCloseSideBar(
                                closed: false,
                                stuck: true,
                              );
                        }
                        final checkScreenSizeConValue =
                            ResponsiveBreakpoints.of(context).largerThan(TABLET);
                        double alignment = checkScreenSizeConValue
                            ? homeProvider.currentTaskIndex == 0
                                ? 0
                                : 0.630
                            : 0;
                        Future.delayed(
                          const Duration(milliseconds: 500),
                          () {
                            itemScrollController.scrollTo(
                              index: homeProvider.currentTaskIndex,
                              duration: const Duration(milliseconds: 400),
                              alignment: alignment,
                            );
                          },
                        );
                      },
                      icon: const Icon(
                        Icons.view_sidebar_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (!(animSidebarProvider.hovered ?? false)) const SizedBox(height: 65),
      ],
    );
  }
}
