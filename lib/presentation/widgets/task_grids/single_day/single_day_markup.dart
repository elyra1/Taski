import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class SingleDayMarkup extends StatelessWidget {
  const SingleDayMarkup({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
