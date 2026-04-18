import 'package:flutter/material.dart';

class FadeThroughTransition extends StatelessWidget {
  const FadeThroughTransition({
    super.key,
    required this.animation,
    required this.secondaryAnimation,
    required this.child,
  });

  final Animation<double> animation;
  final Animation<double> secondaryAnimation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).chain(CurveTween(curve: const Interval(0.0, 0.5))).animate(animation),
      child: FadeTransition(
        opacity: Tween<double>(begin: 1.0, end: 0.0)
            .chain(CurveTween(curve: const Interval(0.5, 1.0)))
            .animate(secondaryAnimation),
        child: child,
      ),
    );
  }
}
