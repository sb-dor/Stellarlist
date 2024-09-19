import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stellarlist/features/home/view/pages/widgets/animated_side_bar/animated_side_bar.dart';

@RoutePage()
class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            child: AnimatedSideBar(),
          )
        ],
      ),
    );
  }
}
