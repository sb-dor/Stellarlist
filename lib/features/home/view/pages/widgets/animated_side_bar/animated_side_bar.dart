import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:stellarlist/core/utils/app_colors.dart';
import 'package:stellarlist/core/utils/constants.dart';
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
            Visibility(
              visible: (animSidebarProvider.hovered ?? false),
              maintainState: true,
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
            _AppBarMainSection(
              icon: Icons.inbox_outlined,
              title: "Inbox",
              onTap: () {},
            ),
            _AppBarMainSection(
              icon: Icons.calendar_month,
              title: "Today",
              onTap: () {},
            ),
            _AppBarMainSection(
              icon: Icons.task_alt,
              title: "Task",
              onTap: () {},
            ),
            _AppBarMainSection(
              icon: Icons.notifications,
              title: "Updates",
              onTap: () {},
            ),
            _AppBarMainSection(
              icon: Icons.list,
              title: "List",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class _AppBarMainSection extends StatefulWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _AppBarMainSection({
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  State<_AppBarMainSection> createState() => _AppBarMainSectionState();
}

class _AppBarMainSectionState extends State<_AppBarMainSection> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (value) => setState(() {
        _hovered = true;
      }),
      onExit: (value) => setState(() {
        _hovered = false;
      }),
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: widget.onTap,
        child: Container(
          color: _hovered ? Colors.grey.withOpacity(0.1) : null,
          height: 35,
          child: Row(
            children: [
              const SizedBox(width: 25),
              Icon(
                widget.icon,
                color: Colors.red,
                size: 15,
              ),
              const SizedBox(width: 10),
              Text(
                widget.title,
                style: GoogleFonts.inter(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
