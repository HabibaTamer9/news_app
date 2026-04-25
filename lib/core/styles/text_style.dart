import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news/core/styles/color.dart';

class AppTextStyle {
  static final TextStyle cardTitleStyle = TextStyle(
      color: AppColors.lightPrimaryTextColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500);
  static final TextStyle cardSubtitleStyle = TextStyle(
      color: AppColors.lightPrimaryTextColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500);
  static final TextStyle grayTextStyle = TextStyle(
      color: AppColors.lightSecondTextColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.normal);
  static final TextStyle titleStyle = TextStyle(
      color: AppColors.lightPrimaryTextColor,
      fontSize: 32.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle subTitleStyle = TextStyle(
      color: AppColors.lightPrimaryTextColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);
  static final TextStyle headline = TextStyle(
      color: AppColors.lightPrimaryTextColor,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle titleMedium = TextStyle(
      color: AppColors.lightPrimaryTextColor,
      fontSize: 17.sp,
      fontWeight: FontWeight.bold);
}

class AppTextStyleDark {
  static final TextStyle cardTitleStyle = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 15.sp,
      fontWeight: FontWeight.w500);
  static final TextStyle cardSubtitleStyle = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 13.sp,
      fontWeight: FontWeight.w500);
  static final TextStyle grayTextStyle = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 12.sp,
      fontWeight: FontWeight.normal);
  static final TextStyle titleStyle = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 32.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle subTitleStyle = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 16.sp,
      fontWeight: FontWeight.w500);
  static final TextStyle headline = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 22.sp,
      fontWeight: FontWeight.bold);
  static final TextStyle titleMedium = TextStyle(
      color: AppColors.darkPrimaryTextColor,
      fontSize: 17.sp,
      fontWeight: FontWeight.bold);
}
