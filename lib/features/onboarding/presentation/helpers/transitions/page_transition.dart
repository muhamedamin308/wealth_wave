import 'package:flutter/material.dart';
import 'package:wealth_wave/features/onboarding/presentation/helpers/widgets/fade_through_transition.dart';

enum PageTransitions {
  fade,
  fadeThrough,
  slideFromRight,
  slideFromBottom;

  Widget Function(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  )
  get builder {
    switch (this) {
      case PageTransitions.fade:
        return (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        };
      case PageTransitions.fadeThrough:
        return (context, animation, secondaryAnimation, child) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        };
      case PageTransitions.slideFromRight:
        return (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.1, 0.0); // Reduced offset for smoother feel
          const end = Offset.zero;
          const curve = Curves.easeOutQuart;
          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(opacity: animation, child: child),
          );
        };
      case PageTransitions.slideFromBottom:
        return (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 0.05);
          const end = Offset.zero;
          const curve = Curves.easeOutCubic;
          final tween = Tween(
            begin: begin,
            end: end,
          ).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: FadeTransition(opacity: animation, child: child),
          );
        };
    }
  }
}
