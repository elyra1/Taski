import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';

abstract class AppTextStyles {
  static TextStyle bold18 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle bold20 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle bold24 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
    color: AppColors.headblue,
  );

  static TextStyle regular18 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.headblue,
  );

  static TextStyle regular20 = TextStyle(
    fontFamily: 'Montserrat',
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.headblue,
  );

  static TextStyle regular24 = TextStyle(
    fontFamily: 'Montserrat',
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
}
