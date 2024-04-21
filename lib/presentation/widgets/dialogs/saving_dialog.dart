import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class SavingDialog extends StatelessWidget {
  const SavingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(15.r),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Сохранение',
              style: AppTextStyles.semibold22,
              textAlign: TextAlign.center,
            ),
            50.h.heightBox,
            const CircularProgressIndicator(color: AppColors.headblue)
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    ).paddingSymmetric(horizontal: 50.w, vertical: 225.h);
  }
}
