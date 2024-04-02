import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

class AddUserToFriendsDialog extends StatelessWidget {
  final UserModel user;
  final void Function() onSendPressed;
  const AddUserToFriendsDialog({
    super.key,
    required this.user,
    required this.onSendPressed,
  });

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
              'Этот пользователь не находится у вас в друзьях',
              style: AppTextStyles.semibold14,
              textAlign: TextAlign.center,
            ),
            10.h.heightBox,
            Text(
              'Добавьте его в друзья, чтобы получить доступ к его расписанию',
              style: AppTextStyles.regular12,
              textAlign: TextAlign.center,
            ),
            10.h.heightBox,
            CustomButton(
              width: double.maxFinite,
              height: 40.h,
              onPressed: () {
                context.pop();
                onSendPressed();
              },
              text: 'Отправить',
            ),
            15.h.heightBox,
            CustomButton(
              width: double.maxFinite,
              color: Colors.white,
              height: 40.h,
              textStyle: AppTextStyles.medium12.copyWith(
                color: AppColors.headblue,
              ),
              onPressed: () => context.pop(),
              text: 'Отмена',
            ),
          ],
        ).paddingSymmetric(horizontal: 15.w),
      ),
    );
  }
}
