// ignore_for_file: use_build_context_synchronously

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/user_search_page/cubit/user_search_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/dialogs/add_user_to_friends_dialog.dart';
import 'package:taski/presentation/widgets/lists/user_search_list.dart';

@RoutePage()
class UserSearchPage extends StatefulWidget implements AutoRouteWrapper {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  State<UserSearchPage> createState() => _UserSearchPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserSearchPageCubit>(
      create: (context) => getIt<UserSearchPageCubit>()..addCurrentUser(),
      child: this,
    );
  }
}

class _UserSearchPageState extends State<UserSearchPage> {
  String searchValue = '';

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<UserSearchPageCubit>();
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
        title: AppTextField(
          onChanged: (value) => setState(() => searchValue = value),
          hintText: 'Поиск пользователей',
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 0, color: AppColors.grey),
          ),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(width: 0.5.r)),
        ).paddingOnly(bottom: 5.h),
      ),
      body: BlocBuilder<UserSearchPageCubit, UserSearchPageState>(
        builder: (context, state) {
          return UserSearchList(
            stream: cubit.getSearchUsersStream(),
            value: searchValue,
            onTap: (user) async {
              final isFriend = (state.currentUser != null)
                  ? state.currentUser!.friendsIds.contains(user.id)
                  : false;
              if (isFriend) {
                context.router.push(HomePage(user: user));
              } else {
                showDialog(
                  context: context,
                  builder: (dialogContext) {
                    return AddUserToFriendsDialog(
                      user: user,
                      onSendPressed: () =>
                          cubit.sendFriendRequest(userId: user.id),
                    ).paddingSymmetric(horizontal: 50.w, vertical: 220.h);
                  },
                );
              }
            },
            isFriend: (user) {
              return (state.currentUser != null)
                  ? state.currentUser!.friendsIds.contains(user.id)
                  : false;
            },
            isSendedRequest: (user) {
              return (user.requests.contains(state.currentUser?.id));
            },
            isRequestingFriend: (user) {
              return (state.currentUser?.requests.contains(user.id) ?? false);
            },
            onSendTap: (user) => cubit.sendFriendRequest(userId: user.id),
            onRemoveTap: (user) => cubit.deleteFromFriends(userId: user.id),
            onUndoRequestTap: (user) => cubit.undoRequest(userId: user.id),
            onAcceptTap: (user) => cubit.acceptFriendRequest(userId: user.id),
            onDeclineTap: (user) => cubit.declineFriendRequest(userId: user.id),
          );
        },
      ).paddingSymmetric(vertical: 10.h, horizontal: 5.w),
    );
  }
}
