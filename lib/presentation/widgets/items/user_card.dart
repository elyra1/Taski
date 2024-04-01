import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_icons.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

class UserCard extends StatelessWidget {
  final UserModel user;
  final bool isFriend;
  final void Function() onTap;
  const UserCard({
    Key? key,
    required this.user,
    required this.onTap,
    required this.isFriend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onTap,
      color: Colors.white,
      width: double.maxFinite,
      height: 50.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 18.r,
            backgroundColor: Colors.white,
            child: user.photoUrl != null
                ? Image.network(user.photoUrl!)
                : SvgPicture.asset(AppIcons.userIcon),
          ),
          10.w.widthBox,
          Text(
            user.username,
            style: AppTextStyles.regular18,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {},
            icon: Icon(
              isFriend ? Icons.remove : Icons.send,
              color: AppColors.headblue,
            ),
          ),
        ],
      ),
    );
  }
}
