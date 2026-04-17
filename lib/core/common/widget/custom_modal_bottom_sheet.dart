import 'package:flutter/material.dart';
import 'package:wealth_wave/core/common/widget/primary_button.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';

class CustomErrorBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onClose;
  final bool isError;

  const CustomErrorBottomSheet({
    super.key,
    required this.title,
    required this.message,
    required this.onClose,
    required this.isError,
  });

  /// Shows the error bottom sheet and returns a Future<void>.
  static Future<void> show(
    BuildContext context, {
    required String title,
    required String message,
    VoidCallback? onClose,
    required bool isError,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isDismissible: true,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      builder: (BuildContext context) => CustomErrorBottomSheet(
        title: title,
        message: message,
        onClose: onClose ?? () {},
        isError: isError,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.surfaceDark,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Error icon + title row
            Row(
              children: [
                Icon(
                  isError ? Icons.error_outline : Icons.check_circle,
                  color: isError ? AppColors.error : AppColors.chartPositive,
                  size: 32,
                ),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: AppTextStyle.headlineMedium.copyWith(
                    fontWeight: FontWeight.bold,
                    color: isError ? AppColors.error : AppColors.chartPositive,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Error subtitle (descriptive message)
            Text(
              message,
              style: AppTextStyle.bodyMedium.copyWith(
                color: AppColors.textPrimary,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 24),

            // Close button – full width for easier tapping
            SizedBox(
              width: double.infinity,
              child: primaryButton(
                'Close',
                () {
                  Navigator.of(context).pop();
                  onClose(); // Call the optional callback after closing
                },
                isError ? AppColors.error : AppColors.chartPositive,
                AppColors.textPrimary,
                radius: 24,
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
