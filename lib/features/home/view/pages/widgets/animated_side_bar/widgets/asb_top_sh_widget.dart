import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';

class AsbTopShowHideWidget extends ConsumerWidget {
  const AsbTopShowHideWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animSidebarProvider = ref.watch(animatedSidebarProviderProvider);
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
