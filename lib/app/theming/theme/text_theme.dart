import 'package:flutter/material.dart';

import '../colors/app_colors.dart';

abstract final class GlobalTextTheme {
  static final TextTheme textTheme = TextTheme(
    displayLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: AppColors.kTextColor,
    ),
    displayMedium: TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      color: AppColors.kTextColor,
    ),
    displaySmall: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: AppColors.kTextColor,
    ),
    headlineLarge: TextStyle(
      fontSize: 22,
      fontWeight: FontWeight.bold,
      color: AppColors.kTextColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: AppColors.kTextColor,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: AppColors.kTextColor,
    ),
    titleLarge: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.w600,
      color: AppColors.kTextColor,
    ),
    titleMedium: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.kTextColor,
    ),
    titleSmall: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.w500,
      color: AppColors.kTextColor,
    ),
    bodyLarge: TextStyle(fontSize: 16, color: AppColors.kTextColor),
    bodyMedium: TextStyle(fontSize: 14, color: AppColors.kTextColor),
    bodySmall: TextStyle(fontSize: 12, color: AppColors.kTextColor),
    labelLarge: TextStyle(
      fontSize: 14,
      fontWeight: FontWeight.w500,
      color: AppColors.kTextColor,
    ),
    labelMedium: TextStyle(fontSize: 12, color: AppColors.kTextColor),
    labelSmall: TextStyle(fontSize: 10, color: AppColors.kTextColor),
  );
}
