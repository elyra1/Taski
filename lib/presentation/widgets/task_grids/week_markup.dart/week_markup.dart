import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class WeekMarkup extends StatelessWidget {
  final DateTime selectedDate;
  const WeekMarkup({
    super.key,
    required this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 17.w,
          child: Row(
            children: [
              for (int i = 0; i < 7; i++) ...[
                Stack(
                  children: [
                    Container(
                      color: AppColors.grey,
                      width: 0.5,
                      height: 100.5.h * 24,
                    ).paddingOnly(left: 44.5.w),
                  ],
                ),
              ]
            ],
          ),
        ),
        Column(
          children: [
            for (int i = 0; i < 24; i++) ...[
              SizedBox(
                height: 100.h,
                child: Row(
                  children: [
                    12.w.widthBox,
                    SizedBox(
                      width: 35.w,
                      child: Text(
                        '$i:00',
                        style: AppTextStyles.medium12
                            .copyWith(color: AppColors.headblue),
                      ),
                    ),
                    8.w.widthBox,
                    Expanded(
                      child: Container(
                        height: 0.5.h,
                        width: double.maxFinite,
                        color: AppColors.grey,
                      ),
                    ),
                  ],
                ).alignAtTopCenter(),
              ),
            ],
          ],
        ),
      ],
    );
  }
}
