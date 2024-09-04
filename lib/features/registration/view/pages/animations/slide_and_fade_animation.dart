import 'package:flutter/material.dart';

class SlideAndFadeAnimation extends StatefulWidget {
  final Widget child;
  final bool animate;

  final Offset beginSlide;
  final Offset endSlide;
  final double beginOpacity;
  final double endOpacity;
  final Duration? duration;

  final bool startShowWidget;
  final bool startAnimationHide;
  final bool endAnimationHide;

  const SlideAndFadeAnimation({
    super.key,
    required this.child,
    this.beginSlide = Offset.zero,
    this.endSlide = const Offset(0.0, 250),
    this.beginOpacity = 1.0,
    this.endOpacity = 0.0,
    this.duration,
    this.animate = false,
    this.startShowWidget = true,
    this.startAnimationHide = true,
    this.endAnimationHide = false,
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

  bool _hideAnimation = false;

  @override
  void initState() {
    super.initState();
    _hideAnimation = widget.startShowWidget;
    _slideAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 500,
          ),
    );

    _fadeAnimationController = AnimationController(
      vsync: this,
      duration: widget.duration ??
          const Duration(
            milliseconds: 500,
          ),
    );

    _slideAnimation = Tween<Offset>(
      begin: widget.beginSlide,
      end: widget.endSlide,
    ).animate(
      CurvedAnimation(
        parent: _slideAnimationController,
        curve: Curves.linear,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: widget.beginOpacity,
      end: widget.endOpacity,
    ).animate(
      CurvedAnimation(
        parent: _fadeAnimationController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant SlideAndFadeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.animate) {
      if (!widget.startShowWidget) {
        _hideAnimation = false;
        setState(() {});
      }
      _slideAnimationController.forward();
      _fadeAnimationController.forward().whenComplete(() {
        _hideAnimation = widget.startAnimationHide;
        setState(() {});
      });
    } else {
      if (!widget.endAnimationHide) {
        _hideAnimation = widget.endAnimationHide;
        setState(() {});
      }
      _slideAnimationController.reverse();
      _fadeAnimationController.reverse().whenComplete(() {
        if (widget.endAnimationHide) {
          _hideAnimation = widget.endAnimationHide;
        }
      });
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
    return _hideAnimation
        ? const SizedBox.shrink()
        : AnimatedBuilder(
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
