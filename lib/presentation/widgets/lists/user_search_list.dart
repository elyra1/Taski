import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/widgets/items/user_card.dart';

class UserSearchList extends StatelessWidget {
  final Stream<Iterable<UserModel>> stream;
  final String value;
  const UserSearchList({Key? key, required this.stream, required this.value})
      : super(key: key);

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
            itemCount: list.length,
            itemBuilder: (context, index) {
              return UserCard(user: list[index])
                  .paddingSymmetric(vertical: 7.h);
            },
          );
        } else {
          return nil;
        }
      },
    );
  }
}
