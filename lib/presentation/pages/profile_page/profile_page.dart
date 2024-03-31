import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/profile_page/cubit/profile_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_icons.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

@RoutePage()
class ProfilePage extends StatefulWidget implements AutoRouteWrapper {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ProfilePageCubit>(
      create: (context) => getIt<ProfilePageCubit>()..init(),
      child: this,
    );
  }
}

class _ProfilePageState extends State<ProfilePage> {
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
        title: Text('Профиль', style: AppTextStyles.bold20),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: BlocBuilder<ProfilePageCubit, ProfilePageState>(
          builder: (context, state) {
            return state.map(
              loaded: (loaded) => Column(
                children: [
                  45.h.heightBox,
                  CircleAvatar(
                    radius: 45.r,
                    backgroundColor: Colors.white,
                    child: loaded.user.photoUrl != null
                        ? Image.network(loaded.user.photoUrl!)
                        : SvgPicture.asset(AppIcons.userIcon),
                  ),
                  Text(
                    loaded.user.username,
                    style: AppTextStyles.bold18,
                  ),
                  60.h.heightBox,
                  CustomButton(
                    width: double.maxFinite,
                    height: 40.h,
                    onPressed: () => context.router.push(const FriendsPage()),
                    text: "Друзья",
                  ),
                  20.h.heightBox,
                  CustomButton(
                    width: double.maxFinite,
                    height: 40.h,
                    onPressed: () {},
                    text: "Редактировать профиль",
                  ),
                  20.h.heightBox,
                  CustomButton(
                    width: double.maxFinite,
                    height: 40.h,
                    onPressed: () {},
                    text: "Настройки",
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () async =>
                        await context.read<ProfilePageCubit>().signOut().then(
                      (value) {
                        context.router.popUntilRoot();
                        context.router.replace(const SignInPage());
                      },
                    ),
                    child: Text(
                      "Выйти из аккаунта",
                      style: AppTextStyles.medium12.copyWith(
                        color: AppColors.elementblue,
                      ),
                    ),
                  ),
                  15.h.heightBox,
                ],
              ),
              loading: (_) => const Center(
                  child: CircularProgressIndicator(
                color: AppColors.headblue,
              )),
            );
          },
        ),
      ),
    );
  }
}
