import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hexcolor/hexcolor.dart';
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
    return AnimatedContainer(
      width: 260,
      height: MediaQuery.of(context).size.height,
      duration: const Duration(seconds: 1),
      decoration: BoxDecoration(
        color: HexColor('#232233'),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.white,
                  size: 20,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.view_sidebar_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
