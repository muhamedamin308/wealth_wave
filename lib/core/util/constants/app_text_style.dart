import 'package:flutter/material.dart';
import 'app_colors.dart'; // adjust import path as needed

class AppTextStyle {
  AppTextStyle._();

  // ========== Headlines ==========
  static const TextStyle headlineLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: -0.5,
  );

  static const TextStyle headlineMedium = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0,
  );

  static const TextStyle headlineSmall = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
    letterSpacing: 0.15,
  );

  // ========== Balance & Large Numbers ==========
  static const TextStyle balance = TextStyle(
    fontSize: 42,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
    letterSpacing: -0.8,
  );

  static const TextStyle amount = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.5,
  );

  static const TextStyle amountIncome = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.income,
    letterSpacing: -0.5,
  );

  static const TextStyle amountExpense = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.expense,
    letterSpacing: -0.5,
  );

  // ========== Body Text ==========
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
    letterSpacing: 0.15,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textPrimary,
    letterSpacing: 0.25,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
    letterSpacing: 0.4,
  );

  // ========== Transaction History Items ==========
  static const TextStyle transactionTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  static const TextStyle transactionDate = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle transactionPositive = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.income,
  );

  static const TextStyle transactionNegative = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.expense,
  );

  // ========== Tab / Statistic Labels ==========
  static const TextStyle statisticTab = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
  );

  static const TextStyle statisticTabActive = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w700,
    color: AppColors.vibrantTeal,
  );

  static const TextStyle statisticValue = TextStyle(
    fontSize: 34,
    fontWeight: FontWeight.w800,
    color: AppColors.textPrimary,
  );

  // ========== Form & Input Labels ==========
  static const TextStyle formLabel = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.textSecondary,
    letterSpacing: 0.5,
  );

  static const TextStyle formValue = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  static const TextStyle formHint = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textHint,
  );

  static const TextStyle errorText = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: AppColors.error,
    letterSpacing: 0.4,
  );

  // ========== Button Text ==========
  static const TextStyle buttonPrimary = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
    letterSpacing: 0.8,
  );

  static const TextStyle buttonSecondary = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.vibrantTeal,
    letterSpacing: 0.5,
  );

  // ========== Profile Section ==========
  static const TextStyle profileName = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );

  static const TextStyle profileEmail = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: AppColors.textSecondary,
  );

  static const TextStyle profileMenu = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColors.textPrimary,
  );

  // ========== Greeting ==========
  static const TextStyle greeting = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  static const TextStyle userName = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w700,
    color: AppColors.textPrimary,
  );
}
