import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model.dart';
import 'package:stellarlist/core/data/models/favorite_model/favorite_model_functions.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/utils/constants.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/widgets/asb_section_widget.dart';
import 'package:stellarlist/features/home/view/provider/home_provider.dart';
import 'widgets/asb_favorites_row_button_widget.dart';
import 'widgets/asb_main_sections_widget.dart';
import 'widgets/asb_top_sh_widget.dart';

class AnimatedSideBar extends ConsumerStatefulWidget {
  const AnimatedSideBar({super.key});

  @override
  ConsumerState createState() => _AnimatedSideBarState();
}

class _AnimatedSideBarState extends ConsumerState<AnimatedSideBar> {
  @override
  Widget build(BuildContext context) {
    final animSidebarProvider = ref.watch(animatedSidebarProviderProvider);
    final homeProvider = ref.watch(homeProviderProvider);
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
        width: (animSidebarProvider.stuck ?? false)
            ? Constants.appBarStuckWidth
            : Constants.appBarUnStuckWith,
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
            const AsbTopShowHideWidget(),
            const AsbMainSectionsWidget(),
            const SizedBox(height: 50),
            const AsbFavoritesRowButtonWidget(),
            const SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: homeProvider.favorites?.length ?? 0,
                itemBuilder: (context, index) {
                  final favorite =
                      FavoriteModelFunctions.fromEntity(homeProvider.favorites?[index]);
                  debugPrint("list id: ${favorite?.id}");
                  return AsbSectionWidget(
                    icon: Icons.note_alt,
                    title: favorite?.title() ?? '',
                    titleNameChange: true,
                    onTap: () {
                      ref.read(homeProviderProvider.notifier).addTaskForTaskListOnClick(favorite!);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
