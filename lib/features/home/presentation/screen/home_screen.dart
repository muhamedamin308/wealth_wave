import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wealth_wave/config/routes/named_routes.dart';
import 'package:wealth_wave/core/common/widget/custom_modal_bottom_sheet.dart';
import 'package:wealth_wave/core/common/widget/primary_button.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';
import 'package:wealth_wave/di/locator.dart';
import 'package:wealth_wave/features/auth/presentation/controller/authentication_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = locator.get<AuthenticationController>();
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.textPrimary,
        title: Text('Home Screen', style: AppTextStyle.headlineMedium),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              primaryButton(
                'Log Out',
                () async {
                  final success = await controller.doLogout();
                  if (!context.mounted) return; // Add this check
                  if (success) {
                    context.goNamed(NamedRoutes.login);
                  } else {
                    CustomMessageBottomSheet.show(
                      context,
                      title: 'Logout Failed',
                      message: 'Failed to log out. Please try again.',
                      isError: true,
                      messageOnButton: 'Try Again',
                    );
                  }
                },
                AppColors.chartNegative,
                AppColors.textPrimary,
                radius: 30.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
