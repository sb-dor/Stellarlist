import 'package:flutter/material.dart';

class SlideFadeTransition extends StatefulWidget {
  final Widget child;
  final bool shouldAnimate;

  final Offset initialSlideOffset;
  final Offset finalSlideOffset;
  final double initialOpacity;
  final double finalOpacity;
  final Duration? animationDuration;

  final bool isInitiallyVisible;
  final bool hideOnStartAnimation;
  final bool hideOnEndAnimation;

  const SlideFadeTransition({
    super.key,
    required this.child,
    this.initialSlideOffset = Offset.zero,
    this.finalSlideOffset = const Offset(0.0, 250),
    this.initialOpacity = 1.0,
    this.finalOpacity = 0.0,
    this.animationDuration,
    this.shouldAnimate = false,
    this.isInitiallyVisible = true,
    this.hideOnStartAnimation = true,
    this.hideOnEndAnimation = false,
  });

  @override
  State<SlideFadeTransition> createState() => _SlideFadeTransitionState();
}

class _SlideFadeTransitionState extends State<SlideFadeTransition>
    with TickerProviderStateMixin {
  late AnimationController _slideController;
  late AnimationController _fadeController;

  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  bool _isHidden = false;

  @override
  void initState() {
    super.initState();
    _isHidden = !widget.isInitiallyVisible;

    _slideController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? const Duration(milliseconds: 500),
    );

    _fadeController = AnimationController(
      vsync: this,
      duration: widget.animationDuration ?? const Duration(milliseconds: 500),
    );

    _slideAnimation = Tween<Offset>(
      begin: widget.initialSlideOffset,
      end: widget.finalSlideOffset,
    ).animate(
      CurvedAnimation(
        parent: _slideController,
        curve: Curves.linear,
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: widget.initialOpacity,
      end: widget.finalOpacity,
    ).animate(
      CurvedAnimation(
        parent: _fadeController,
        curve: Curves.linear,
      ),
    );
  }

  @override
  void didUpdateWidget(covariant SlideFadeTransition oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.shouldAnimate) {
      if (!widget.isInitiallyVisible) {
        _isHidden = false;
        setState(() {});
      }
      _slideController.forward();
      _fadeController.forward().whenComplete(() {
        _isHidden = widget.hideOnStartAnimation;
        setState(() {});
      });
    } else {
      if (!widget.hideOnEndAnimation) {
        _isHidden = widget.hideOnEndAnimation;
        setState(() {});
      }
      _slideController.reverse();
      _fadeController.reverse().whenComplete(() {
        if (widget.hideOnEndAnimation) {
          _isHidden = widget.hideOnEndAnimation;
        }
      });
    }
  }

  @override
  void dispose() {
    _slideController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return _isHidden
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