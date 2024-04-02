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
import 'package:taski/presentation/widgets/dialogs/add_user_to_friends_dialog.dart';
import 'package:taski/presentation/widgets/lists/user_search_list.dart';

@RoutePage()
class FriendsPage extends StatelessWidget implements AutoRouteWrapper {
  const FriendsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<FriendsPageCubit>();
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
          return UserSearchList(
            stream: cubit.getriendsStream(),
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
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<FriendsPageCubit>(
      create: (context) => getIt<FriendsPageCubit>(),
      child: this,
    );
  }
}
