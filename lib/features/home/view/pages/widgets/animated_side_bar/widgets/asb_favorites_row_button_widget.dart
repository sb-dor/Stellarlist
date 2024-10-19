import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/provider/anim_sidebar_provider.dart';

class AsbFavoritesRowButtonWidget extends ConsumerWidget {
  const AsbFavoritesRowButtonWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final animSidebarProvider = ref.watch(animatedSidebarProviderProvider);
    return Padding(
      padding: const EdgeInsets.only(left: 25, right: 15),
      child: SizedBox(
        height: 40,
        child: Row(
          children: [
            Text(
              "Favorites",
              style: GoogleFonts.inter(color: Colors.grey.shade700),
            ),
            const Expanded(child: SizedBox.shrink()),
            Visibility(
              maintainAnimation: true,
              maintainState: true,
              visible: (animSidebarProvider.hovered ?? false),
              child: AnimatedOpacity(
                opacity: (animSidebarProvider.hovered ?? false) ? 1 : 0,
                duration: const Duration(milliseconds: 300),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_link,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.playlist_add_sharp,
                        size: 20,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
