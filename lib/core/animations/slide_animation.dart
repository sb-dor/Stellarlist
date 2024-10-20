import 'package:flutter/material.dart';

class SlideAnimation extends StatelessWidget {
  final Widget child;
  final VoidCallback? onEnd;
  final Offset? begin;
  final Offset? end;
  final Duration? duration;
  final double? beginInterval;
  final double? endInterval;
  final Curve? curve;

  const SlideAnimation({
    super.key,
    required this.child,
    this.onEnd,
    this.begin,
    this.end,
    this.duration,
    this.beginInterval,
    this.endInterval,
    this.curve,
  });

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder(
      tween: Tween<Offset>(
        begin: begin ?? const Offset(250.0, 0.0),
        end: end ?? const Offset(0.0, 0.0),
      ),
      duration: duration ?? const Duration(milliseconds: 450),
      curve: Interval(
        beginInterval ?? 0,
        endInterval ?? 1,
        curve: curve ?? Curves.fastOutSlowIn,
      ),
      builder: (context, position, child) {
        return this.child;
      },
      onEnd: onEnd,
    );
  }
}
