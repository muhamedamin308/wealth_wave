import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/route_names.dart';
import 'package:wealth_wave/config/theme/default_theme.dart';
import 'package:wealth_wave/features/auth/presentation/pages/create_account_screen.dart';
import 'package:wealth_wave/features/auth/presentation/pages/login_screen.dart';
import 'package:wealth_wave/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:wealth_wave/features/onboarding/presentation/pages/splash_screen.dart';

class App extends StatelessWidget {
  App({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
      ),
      child: MaterialApp.router(
        routerConfig: _router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(inputDecorationTheme: defaultInputDecorationTheme),
      ),
    );
  }

  final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        name: NamedRoutes.splash,
        path: "/",
        builder: ((context, state) => const SplashScreen()),
      ),
      GoRoute(
        name: NamedRoutes.onboarding,
        path: "/onboarding",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const OnboardingScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeInOutCirc,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        name: NamedRoutes.signup,
        path: "/signup",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: CreateAccountScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeInOutCirc,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
      GoRoute(
        name: NamedRoutes.login,
        path: "/login",
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: LoginScreen(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
                  return FadeTransition(
                    opacity: CurveTween(
                      curve: Curves.easeInOutCirc,
                    ).animate(animation),
                    child: child,
                  );
                },
          );
        },
      ),
    ],
  );
}
