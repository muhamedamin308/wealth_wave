import 'package:flutter/material.dart';
import 'package:wealth_wave/core/util/constants/app_colors.dart';

class CustomCircularProgressIndicator extends StatelessWidget {
  final Color progressColor;
  const CustomCircularProgressIndicator({
    this.progressColor = AppColors.vibrantTeal,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(color: progressColor);
  }
}
