import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/widgets/items/user_card.dart';

class UserSearchList extends StatelessWidget {
  final Stream<Iterable<UserModel>> stream;
  final String value;
  final void Function(UserModel user) onTap;
  final bool Function(UserModel user) isFriend;
  final void Function() onSendTap;
  final void Function() onRemoveTap;
  final void Function() onUndoRequestTap;
  final void Function() onAcceptTap;
  final void Function() onDeclineTap;
  const UserSearchList({
    Key? key,
    required this.stream,
    required this.value,
    required this.onTap,
    required this.isFriend,
    required this.onSendTap,
    required this.onRemoveTap,
    required this.onUndoRequestTap,
    required this.onAcceptTap,
    required this.onDeclineTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final list = snapshot.data!
              .where((element) => element.username.contains(value))
              .toList();
          if (list.isEmpty) return nil;
          return ListView.builder(
            physics: const BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.fast),
            itemCount: list.length,
            itemBuilder: (context, index) {
              return UserCard(
                user: list[index],
                onTap: () => onTap(list[index]),
                isFriend: isFriend(list[index]),
                onSendTap: onSendTap,
                onRemoveTap: onRemoveTap,
              ).paddingSymmetric(vertical: 7.h);
            },
          );
        } else {
          return nil;
        }
      },
    );
  }
}
