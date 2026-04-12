import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

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
              // App icon / logo (optional, adds to the finance app identity)
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
            ],
          ),
        ),
      ),
    );
  }
}
