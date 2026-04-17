import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/route_names.dart';
import 'package:wealth_wave/core/common/widget/custom_circular_progress_indicator.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/di/locator.dart';
import 'package:wealth_wave/features/onboarding/presentation/bloc/splash_state.dart';
import 'package:wealth_wave/features/onboarding/presentation/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SplashController _splashController = locator.get<SplashController>();
  @override
  void initState() {
    super.initState();
    _splashController.isUserLoggedIn();
    _splashController.addListener(() {
      if (_splashController.state is SplashSuccessState) {
        // Navigate to the main app screen (e.g., dashboard)
      } else {
        context.goNamed(NamedRoutes.onboarding);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: AppColors.primaryGradient,
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // App icon / logo
              Icon(
                Icons.trending_up_rounded,
                size: 80,
                color: AppColors.textPrimary.withValues(alpha: 0.9),
              ),
              const SizedBox(height: 24),
              const Text(
                'WealthWave',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.5,
                  fontFamily: 'Inter',
                  color: AppColors.textPrimary,
                  shadows: [
                    Shadow(
                      color: Color(0xFF3AAFA9),
                      blurRadius: 24,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Text(
                'Track · Save · Grow',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                  color: AppColors.textPrimary.withValues(alpha: 0.9),
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 16),
              CustomCircularProgressIndicator(
                progressColor: AppColors.textPrimary.withValues(alpha: 0.8),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
