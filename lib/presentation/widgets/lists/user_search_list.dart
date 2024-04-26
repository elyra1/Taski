import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/items/user_card.dart';

class UserSearchList extends StatelessWidget {
  final Iterable<UserModel> users;
  final String? value;
  final void Function(UserModel user) onTap;
  final bool Function(UserModel user) isFriend;
  final bool Function(UserModel user) isSendedRequest;
  final bool Function(UserModel user) isRequestingFriend;
  final void Function(UserModel user) onSendTap;
  final void Function(UserModel user) onRemoveTap;
  final void Function(UserModel user) onUndoRequestTap;
  final void Function(UserModel user) onAcceptTap;
  final void Function(UserModel user) onDeclineTap;
  const UserSearchList({
    Key? key,
    required this.users,
    this.value,
    required this.onTap,
    required this.isFriend,
    required this.onSendTap,
    required this.onRemoveTap,
    required this.onUndoRequestTap,
    required this.onAcceptTap,
    required this.onDeclineTap,
    required this.isSendedRequest,
    required this.isRequestingFriend,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = users
        .where((element) =>
            value != null ? element.username.contains(value!) : true)
        .toList();
    if (list.isEmpty && value == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Вы не добавили в друзья ни одного пользователя! Попробуйте найти пользователя по его никнейму и отправить ему запрос на добавление в друзья',
            style:
                AppTextStyles.regular12.copyWith(fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
          15.h.heightBox,
          CustomButton(
            width: 300.w,
            height: 40.h,
            text: 'Найти пользователей',
            onPressed: () => context.router.push(const UserSearchPage()),
          ),
        ],
      );
    }
    return ListView.builder(
      physics: const BouncingScrollPhysics(
          decelerationRate: ScrollDecelerationRate.fast),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return UserCard.friendList(
          user: list[index],
          onTap: () => onTap(list[index]),
          isFriend: isFriend(list[index]),
          sendedRequest: isSendedRequest(list[index]),
          requestingFriend: isRequestingFriend(list[index]),
          onSendTap: () => onSendTap(list[index]),
          onRemoveTap: () => onRemoveTap(list[index]),
          onUndoRequestTap: () => onUndoRequestTap(list[index]),
          onAcceptTap: () => onAcceptTap(list[index]),
          onDeclineTap: () => onDeclineTap(list[index]),
        ).paddingSymmetric(vertical: 7.h);
      },
    );
  }
}
