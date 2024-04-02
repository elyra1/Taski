import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/friends_page/cubit/friends_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/items/user_card.dart';

@RoutePage()
class FriendsPage extends StatelessWidget implements AutoRouteWrapper {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            height: 1.h,
            width: double.maxFinite,
            color: AppColors.headblue,
          ),
        ),
        backgroundColor: AppColors.basewhite,
        leading: const BackButton(
          color: AppColors.headblue,
        ),
        actions: [
          IconButton(
            onPressed: () => context.router.push(const UserSearchPage()),
            icon: const Icon(
              Icons.search,
              color: AppColors.headblue,
            ),
          )
        ],
        title: Text('Друзья', style: AppTextStyles.bold20),
      ),
      body: BlocBuilder<FriendsPageCubit, FriendsPageState>(
        builder: (context, state) {
          return state.map(
            loaded: (loaded) {
              if (loaded.friendsList.isEmpty) {
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
              } else {
                return ListView.builder(
                  itemCount: loaded.friendsList.length,
                  itemBuilder: (context, index) {
                    return UserCard(
                      user: loaded.friendsList[index],
                      onTap: () => context.router.push(
                        HomePage(
                          user: loaded.friendsList[index],
                        ),
                      ),
                      isFriend: true,
                      onRemoveTap: () {},
                      onSendTap: () {},
                    ).paddingSymmetric(vertical: 7.h);
                  },
                ).paddingOnly(left: 5.w, right: 5.w, top: 15.h);
              }
            },
            loading: (loaded) => const CircularProgressIndicator(
              color: AppColors.headblue,
            ).toCenter(),
          );
        },
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<FriendsPageCubit>(
      create: (context) => getIt<FriendsPageCubit>()..loadFriends(),
      child: this,
    );
  }
}
