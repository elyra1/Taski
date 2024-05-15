import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_icons.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class PickPhotoIconButton extends StatelessWidget {
  final VoidCallback onTap;
  const PickPhotoIconButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 140.r,
          height: 140.r,
          child: SvgPicture.asset(AppIcons.userIcon),
        ),
        Container(
          width: 140.r,
          height: 140.r,
          color: Colors.white.withOpacity(0.9),
        ),
        IconButton(
          onPressed: onTap,
          icon: Column(
            children: [
              Icon(
                Icons.edit,
                size: 35.r,
                color: AppColors.headblue,
              ),
              5.h.heightBox,
              Text(
                "Выбрать фото",
                style: AppTextStyles.semibold12,
              )
            ],
          ).paddingLTRB(10.r, 28.r, 10.r, 28.r),
        ),
      ],
    );
  }
}
