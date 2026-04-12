import 'dart:ui';

class AppColors {
  AppColors._();

  // ========== Brand / Primary Gradients ==========
  static const Color vibrantTeal = Color(0xFF2B7A78);
  static const Color midTeal = Color(0xFF1F4E4C);
  static const Color deepDark = Color(0xFF0A1C1F);

  // Gradient used on splash screen and app bar
  static const List<Color> primaryGradient = [vibrantTeal, midTeal, deepDark];

  // ========== Background & Surface ==========
  static const Color scaffoldBackground = deepDark; // #0A1C1F
  static const Color cardBackground = Color(0xFF17252A); // from original design
  static const Color surfaceDark = Color(
    0xFF1E2A2E,
  ); // slightly lighter than card
  static const Color inputBackground = Color(0xFF1F2C30);

  // ========== Text Colors ==========
  static const Color textPrimary = Color(0xFFFFFFFF); // white
  static const Color textSecondary = Color(0xFFB0BEC5); // light grey-blue
  static const Color textHint = Color(0xFF78909C); // muted grey
  static const Color textDisabled = Color(0xFF546E7A);

  // ========== Accent / Semantic Colors ==========
  static const Color income = Color(
    0xFF4CAF50,
  ); // green for positive amounts (+$850)
  static const Color expense = Color(
    0xFFEF5350,
  ); // red for negative amounts (-$85, -$1,406)
  static const Color warning = Color(
    0xFFFFA726,
  ); // orange for low balance alerts
  static const Color info = Color(
    0xFF29B6F6,
  ); // light blue for informational notes

  // ========== UI Elements ==========
  static const Color divider = Color(0xFF2C3E44); // subtle separator line
  static const Color border = Color(0xFF2A3B40); // input borders
  static const Color shadow = Color(0x1A000000); // with opacity
  static const Color overlayDark = Color(0x80000000); // modal overlay

  // ========== Chart & Statistic ==========
  static const Color chartPositive = income; // green for growth
  static const Color chartNegative = expense; // red for decline
  static const Color chartNeutral = vibrantTeal; // teal for neutral data
  static const List<Color> chartGradient = [
    vibrantTeal,
    Color(0xFF3AAFA9), // lighter teal for chart bars
  ];

  // ========== Error & Validation ==========
  static const Color error = expense; // red for error messages
  static const Color errorBackground = Color(
    0x33EF5350,
  ); // semi-transparent red background for error fields
}
