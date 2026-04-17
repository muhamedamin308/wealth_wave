import 'package:flutter/material.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';
import 'package:wealth_wave/core/util/constants/app_text_style.dart';

Widget primaryButton(
  String buttonContentText,
  VoidCallback? onClick,
  Color backgroundColor,
  Color foregroundColor, {
  double radius = 8.0,
}) {
  return SizedBox(
    width: double.infinity,
    child: ElevatedButton(
      onPressed: () {
        if (onClick != null) {
          onClick();
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: onClick != null
            ? backgroundColor
            : AppColors.shadow, // disabled state color
        foregroundColor: foregroundColor,
        padding: EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
      child: Text(
        buttonContentText,
        style: AppTextStyle.buttonPrimary.copyWith(color: foregroundColor),
      ),
    ),
  );
}
