import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../styles/color.dart';
import '../styles/text_style.dart';

class DarkTheme{
  static ThemeData darkTheme = ThemeData(
    iconTheme: IconThemeData(color: AppColors.darkIconsColor),
      appBarTheme: AppBarTheme(
          elevation: 0,
          scrolledUnderElevation: 0,
          surfaceTintColor: Colors.transparent,
          color: AppColors.darkBackground,
          titleTextStyle: AppTextStyleDark.headline,
          centerTitle: true
      ),
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardColor: AppColors.darkCard,
      textTheme: TextTheme(
          headlineMedium: AppTextStyleDark.headline,
          headlineSmall: AppTextStyleDark.titleStyle,
          titleLarge: TextStyle(
            color: AppColors.darkPrimaryTextColor,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
          titleMedium: AppTextStyleDark.titleMedium,
          titleSmall: AppTextStyleDark.cardTitleStyle,
          bodyLarge: AppTextStyleDark.subTitleStyle,
          bodyMedium: AppTextStyleDark.cardSubtitleStyle,
          bodySmall: AppTextStyleDark.grayTextStyle));
}