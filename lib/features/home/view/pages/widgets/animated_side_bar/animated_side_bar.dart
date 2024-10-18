import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';

class AnimatedSideBar extends ConsumerStatefulWidget {
  const AnimatedSideBar({super.key});

  @override
  ConsumerState createState() => _AnimatedSideBarState();
}

class _AnimatedSideBarState extends ConsumerState<AnimatedSideBar> {
  @override
  Widget build(BuildContext context) {
    final animSidebarProvider = ref.watch(animatedSidebarProviderProvider);
    return MouseRegion(
      onEnter: (value) {
        ref.read(animatedSidebarProviderProvider.notifier).hovered(true);
      },
      onExit: (value) {
        ref.read(animatedSidebarProviderProvider.notifier).hovered(false);
        if (!(animSidebarProvider.stuck ?? false)) {
          ref.read(animatedSidebarProviderProvider.notifier).openCloseSideBar(
                closed: true,
                stuck: false,
              );
        }
      },
      child: AnimatedContainer(
        width: (animSidebarProvider.stuck ?? false) ? 265 : 250,
        height: MediaQuery.of(context).size.height,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          color: AppColors.containerColor,
          borderRadius:
              (animSidebarProvider.stuck ?? false) ? BorderRadius.zero : BorderRadius.circular(20),
          border: (animSidebarProvider.stuck ?? false)
              ? null
              : Border.all(
                  color: Colors.grey,
                  width: 0.1,
                ),
        ),
        child: Column(
          children: [
            Visibility(
              visible: (animSidebarProvider.hovered ?? false),
              maintainState: true,
              maintainAnimation: true,
              child: AnimatedOpacity(
                opacity: (animSidebarProvider.hovered ?? false) ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
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
            )
          ],
        ),
      ),
    );
  }
}
