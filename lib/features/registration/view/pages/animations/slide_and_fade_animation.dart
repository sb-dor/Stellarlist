import 'package:flutter/material.dart';

class SlideAndFadeAnimation extends StatefulWidget {
  final Widget child;
  final bool animate;

  const SlideAndFadeAnimation({
    super.key,
    required this.child,
    this.animate = false,
  });

  @override
  State<SlideAndFadeAnimation> createState() => _SlideAndFadeAnimationState();
}

class _SlideAndFadeAnimationState extends State<SlideAndFadeAnimation>
    with TickerProviderStateMixin {
  late AnimationController _slideAnimationController;
  late AnimationController _fadeAnimationController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 500,
      ),
    );

    _slideAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0.0, 250),
    ).animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.linear,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 1.0,
      end: 0.0,
    ).animate(
      CurvedAnimation(
        parent: _fadeAnimationController,
        curve: Curves.linear,
      ),
    );

    debugPrint("data: ${widget.animate}");
    if (widget.animate) {
      _slideAnimationController.forward();
      _fadeAnimationController.forward();
    }
  }

  @override
  void dispose() {
    _slideAnimationController.dispose();
    _fadeAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge(
        [
          _slideAnimation,
          _fadeAnimation,
        ],
      ),
      builder: (context, animation) {
        return Transform.translate(
          offset: _slideAnimation.value,
          child: Opacity(
            opacity: _fadeAnimation.value,
            child: widget.child,
          ),
        );
      },
    );
  }
}
