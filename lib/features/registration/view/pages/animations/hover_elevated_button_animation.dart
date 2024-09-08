import 'package:flutter/material.dart';

class HoverElevatedButtonAnimation extends StatefulWidget {
  final Color initialColor;
  final Color finalColor;
  final Duration duration;
  final Widget child;
  final VoidCallback onTap;
  final ValueChanged<bool> onHover;

  const HoverElevatedButtonAnimation({
    super.key,
    required this.initialColor,
    required this.finalColor,
    required this.duration,
    required this.child,
    required this.onTap,
    required this.onHover,
  });

  @override
  State<HoverElevatedButtonAnimation> createState() => _HoverElevatedButtonAnimationState();
}

class _HoverElevatedButtonAnimationState extends State<HoverElevatedButtonAnimation>
    with SingleTickerProviderStateMixin {
  late final AnimationController _colorTransitionController;
  late final Animation<Color?> _colorTransitionAnimation;

  @override
  void initState() {
    super.initState();
    _colorTransitionController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    _colorTransitionAnimation =
        ColorTween(begin: widget.initialColor, end: widget.finalColor).animate(
      _colorTransitionController,
    );
  }

  @override
  void dispose() {
    _colorTransitionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (v) {
        widget.onHover(true);
        _colorTransitionController.forward();
      },
      onExit: (v) {
        widget.onHover(false);
        _colorTransitionController.reverse();
      },
      child: AnimatedBuilder(
        animation: _colorTransitionAnimation,
        builder: (context, animation) {
          return ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(
                _colorTransitionAnimation.value,
              ),
            ),
            onPressed: widget.onTap,
            child: widget.child,
          );
        },
      ),
    );
  }
}
