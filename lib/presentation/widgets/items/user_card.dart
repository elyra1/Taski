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
  final VoidCallback onTap;
  final Widget? actions;
  final double? width;
  final double? height;
  final double? radius;
  final double? elevation;
  const UserCard({
    Key? key,
    required this.user,
    required this.onTap,
    this.actions,
    this.width,
    this.height,
    this.radius,
    this.elevation,
  }) : super(key: key);

  factory UserCard.friendList({
    required UserModel user,
    required VoidCallback onTap,
    required bool isFriend,
    required bool sendedRequest,
    required bool requestingFriend,
    required VoidCallback onSendTap,
    required VoidCallback onRemoveTap,
    required VoidCallback onUndoRequestTap,
    required VoidCallback onAcceptTap,
    required VoidCallback onDeclineTap,
  }) =>
      UserCard(
        user: user,
        onTap: onTap,
        actions: Row(
          children: [
            if (requestingFriend) ...[
              IconButton(
                onPressed: onAcceptTap,
                icon: const Icon(
                  Icons.check,
                  color: AppColors.headblue,
                ),
              ),
              IconButton(
                onPressed: onDeclineTap,
                icon: const Icon(
                  Icons.cancel,
                  color: AppColors.headblue,
                ),
              ),
            ] else
              IconButton(
                onPressed: isFriend
                    ? onRemoveTap
                    : sendedRequest
                        ? onUndoRequestTap
                        : onSendTap,
                icon: Icon(
                  isFriend
                      ? Icons.remove
                      : sendedRequest
                          ? Icons.undo
                          : Icons.send,
                  color: AppColors.headblue,
                ),
              ),
          ],
        ),
      );

  factory UserCard.addToContributors({
    Key? key,
    required UserModel user,
    required VoidCallback onTap,
    required bool isContributor,
  }) =>
      UserCard(
        key: key,
        user: user,
        onTap: onTap,
        height: 40.h,
        actions: Checkbox(
          value: isContributor,
          onChanged: (_) => onTap(),
        ),
      );

  factory UserCard.contributorList({
    Key? key,
    required UserModel user,
    required VoidCallback onTap,
    required VoidCallback onRemoveTap,
    required bool isAuthor,
    required bool removeAvaliable,
  }) =>
      UserCard(
        key: key,
        user: user,
        onTap: onTap,
        height: 40.h,
        radius: 5.r,
        actions: isAuthor
            ? SvgPicture.asset(
                AppIcons.crownIcon,
                width: 22.r,
                height: 22.r,
                color: AppColors.red,
              ).paddingOnly(right: 12.w)
            : removeAvaliable
                ? IconButton(
                    onPressed: onRemoveTap,
                    icon: const Icon(
                      Icons.remove,
                      color: AppColors.headblue,
                    ),
                  )
                : null,
      );

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: onTap,
      color: Colors.white,
      width: double.maxFinite,
      height: height ?? 50.h,
      radius: radius,
      elevation: elevation,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: height != null ? (height! / 2.7) : 18.r,
            backgroundColor: Colors.white,
            child: user.photoUrl != null
                ? Image.network(user.photoUrl!)
                : SvgPicture.asset(AppIcons.userIcon),
          ),
          10.w.widthBox,
          Expanded(
            flex: 2,
            child: Text(
              user.username,
              style: AppTextStyles.regular18,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const Spacer(),
          if (actions != null) actions!,
        ],
      ),
    );
  }
}
