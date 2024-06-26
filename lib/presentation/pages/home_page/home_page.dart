import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_bars/app_bottom_navigation_bar.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';
import 'package:taski/presentation/widgets/buttons/circle_add_button.dart';

@RoutePage()
class HomePage extends StatelessWidget implements AutoRouteWrapper {
  final UserModel? user;
  const HomePage({super.key, this.user});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [
        TasksSingleDayPage(user: user),
        WeekTasksPage(user: user),
        TasksMonthPage(user: user),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return BlocBuilder<HomePageCubit, HomePageState>(
          builder: (context, state) {
            return Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: MainAppBar(
                isNonCurrent: user != null,
                onTap: () => context.router.push(const ProfilePage()).then(
                      (value) async => await context.read<HomePageCubit>().init(
                            user: user,
                          ),
                    ),
                photoUrl: state.user.photoUrl,
              ),
              body: Column(
                children: [
                  if (user != null)
                    Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColors.lightblue,
                        borderRadius: BorderRadius.vertical(
                          bottom: Radius.circular(10.r),
                        ),
                      ),
                      child: Text(
                        'Вы находитесь в профиле у пользователя ${user!.username}',
                        style: AppTextStyles.semibold12
                            .copyWith(color: AppColors.headblue),
                      ).paddingSymmetric(horizontal: 15.w, vertical: 5.h),
                    ),
                  Expanded(child: child),
                ],
              ),
              floatingActionButton: user == null
                  ? CircleAddButton(
                      onTap: () => context.router.push(CreateTaskPage()),
                    )
                  : null,
              bottomNavigationBar: AppBottomNavigationBar(
                currentIndex: tabsRouter.activeIndex,
                onTap: (index) => tabsRouter.setActiveIndex(index),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => getIt<HomePageCubit>()..init(user: user),
      child: this,
    );
  }
}
