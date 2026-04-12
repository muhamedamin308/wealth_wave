import 'package:flutter/material.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: Column(
        children: [
          // Top area: illustration image (2/5 of screen)
          Expanded(
            flex: 4,
            child: Container(
              color: AppColors.scaffoldBackground,
              child: Image.asset('assets/images/onboarding_image.png'),
            ),
          ),
          // Bottom area: text + button + sign in link (3/5 of screen)
          Expanded(
            flex: 3, // increased from 1 → more room
            child: Container(
              color: AppColors.scaffoldBackground,
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: const _BottomContent(),
            ),
          ),
        ],
      ),
    );
  }
}

// Extracted bottom content for better readability
class _BottomContent extends StatelessWidget {
  const _BottomContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Spacer(flex: 2),
        _buildMainTitle(),
        const Spacer(flex: 2),
        _buildGetStartedButton(),
        const SizedBox(height: 24),
        _buildSignInLink(),
        const Spacer(flex: 2),
      ],
    );
  }

  Widget _buildMainTitle() {
    return Text(
      'Spend Smarter\nSave More',
      style: AppTextStyle.balance,
      textAlign: TextAlign.center,
      softWrap: true,
    );
  }

  Widget _buildGetStartedButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // TODO: Navigate to login/signup
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.vibrantTeal,
          foregroundColor: AppColors.textPrimary,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text('Get Started', style: AppTextStyle.buttonPrimary),
      ),
    );
  }

  Widget _buildSignInLink() {
    return GestureDetector(
      onTap: () {
        // TODO: Navigate to sign in
      },
      child: RichText(
        text: TextSpan(
          text: 'Already Have Account? ',
          style: AppTextStyle.bodySmall,
          children: [
            TextSpan(
              text: 'Sign In',
              style: AppTextStyle.buttonSecondary.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
