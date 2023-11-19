import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';

abstract class AppTextStyles {
  static const String _montserratString = 'Montserrat';

  static TextStyle bold8 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 8.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle bold16 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 16.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle bold18 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle bold20 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle bold24 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle regular18 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.headblue,
  );

  static TextStyle regular20 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.headblue,
  );

  static TextStyle regular24 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.headblue,
  );

  static TextStyle medium12 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );
  static TextStyle semibold22 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.headblue,
  );
  static TextStyle semibold12 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.headblue,
  );
  static TextStyle semibold14 = TextStyle(
    fontFamily: _montserratString,
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.headblue,
  );
}
