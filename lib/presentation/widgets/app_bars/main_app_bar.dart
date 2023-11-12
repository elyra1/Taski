import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_icons.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget{
  final Widget? child;
  const MainAppBar({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: child,
      centerTitle: true,
      leading: Text(
        'TASKI',
        style: AppTextStyles.bold24,
      ).toCenter(),
      leadingWidth: 90.w,
      actions: [
        IconButton(
        icon: SvgPicture.asset(AppIcons.userIcon, color: AppColors.headblue),
        onPressed: () {
          // Заглушка функции, которая будет вызываться при нажатии на иконку
        },
      )
      ],
      bottom: PreferredSize(
     preferredSize: Size.fromHeight(1.h),
     child: Container(
        color: AppColors.headblue,
        height: 1.h,
     ),
    ),
   );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}