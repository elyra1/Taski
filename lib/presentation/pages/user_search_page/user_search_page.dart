import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/pages/user_search_page/cubit/user_search_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/lists/user_search_list.dart';

@RoutePage()
class UserSearchPage extends StatefulWidget implements AutoRouteWrapper {
  const UserSearchPage({Key? key}) : super(key: key);

  @override
  State<UserSearchPage> createState() => _UserSearchPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<UserSearchPageCubit>(
      create: (context) => getIt<UserSearchPageCubit>(),
      child: this,
    );
  }
}

class _UserSearchPageState extends State<UserSearchPage> {
  String searchValue = '';
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
        title: AppTextField(
          onChanged: (value) => setState(() => searchValue = value),
          hintText: 'Поиск пользователей',
        ),
      ),
      body: UserSearchList(
        stream: context.read<UserSearchPageCubit>().getSearchUsersStream(),
        value: searchValue,
      ).paddingSymmetric(vertical: 10.h, horizontal: 5.w),
    );
  }
}
