import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/styles/color.dart';
import 'package:news/core/styles/text_style.dart';

class LightTheme {
  static ThemeData lightTheme = ThemeData(
    iconTheme: IconThemeData(color: Colors.black),
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        backgroundColor: AppColors.lightBackground,
        titleTextStyle: AppTextStyle.headline,
        centerTitle: true
      ),
      scaffoldBackgroundColor: AppColors.lightBackground,
      cardColor: AppColors.lightCard,
      textTheme: TextTheme(
          headlineMedium: AppTextStyle.headline,
          headlineSmall: AppTextStyle.titleStyle,
          titleLarge: TextStyle(
            color: AppColors.lightPrimaryTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: AppTextStyle.titleMedium,
          titleSmall: AppTextStyle.cardTitleStyle,
          bodyLarge: AppTextStyle.subTitleStyle,
          bodyMedium: AppTextStyle.cardSubtitleStyle,
          bodySmall: AppTextStyle.grayTextStyle));
}
