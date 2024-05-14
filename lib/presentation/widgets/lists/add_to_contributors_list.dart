import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/items/user_card.dart';

class AddToContributorsList extends StatefulWidget {
  final Future<List<UserModel>> friends;
  final List<UserModel> initialContributors;
  final void Function(List<UserModel> users) onConfirm;
  const AddToContributorsList({
    super.key,
    required this.friends,
    required this.onConfirm,
    required this.initialContributors,
  });

  @override
  State<AddToContributorsList> createState() => _AddToContributorsListState();
}

class _AddToContributorsListState extends State<AddToContributorsList> {
  List<UserModel> addedToContributors = [];
  @override
  void initState() {
    addedToContributors.addAll(widget.initialContributors);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.vertical(top: Radius.circular(10.r)),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Добавление участников",
                style: AppTextStyles.bold16,
              ),
              IconButton(
                  onPressed: () => widget.onConfirm(addedToContributors),
                  icon: const Icon(
                    Icons.check,
                    color: AppColors.headblue,
                  ))
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: widget.friends,
              builder: (context, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.data!.isNotEmpty) {
                    final users = snapshot.data!;
                    return ListView.builder(
                      itemCount: users.length,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return UserCard.addToContributors(
                          user: users[index],
                          onTap: () {
                            if (addedToContributors.contains(users[index])) {
                              setState(() =>
                                  addedToContributors.remove(users[index]));
                            } else {
                              setState(
                                  () => addedToContributors.add(users[index]));
                            }
                          },
                          isContributor:
                              addedToContributors.contains(users[index]),
                        ).paddingSymmetric(vertical: 7.h);
                      },
                    );
                  } else {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Вы не добавили в друзья ни одного пользователя! Попробуйте найти пользователя по его никнейму и отправить ему запрос на добавление в друзья',
                          style: AppTextStyles.regular12
                              .copyWith(fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        ),
                        15.h.heightBox,
                        CustomButton(
                          width: 300.w,
                          height: 40.h,
                          text: 'Найти пользователей',
                          onPressed: () =>
                              context.router.push(const UserSearchPage()),
                        ),
                      ],
                    );
                  }
                } else {
                  return const CircularProgressIndicator(
                    color: AppColors.headblue,
                  ).toCenter();
                }
              },
            ),
          ),
        ],
      ).paddingSymmetric(vertical: 10.h, horizontal: 15.w),
    );
  }
}
