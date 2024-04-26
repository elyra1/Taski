import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/custom_page_view_scroll_physics.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_task_grid.dart';

@RoutePage()
class TasksSingleDayPage extends StatelessWidget implements AutoRouteWrapper {
  final UserModel? user;
  const TasksSingleDayPage({Key? key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasksSingleDayPageCubit>();
    return BlocBuilder<TasksSingleDayPageCubit, TasksSingleDayPageState>(
      builder: (context, state) {
        return PageView.builder(
          physics: const CustomPageViewScrollPhysics(),
          allowImplicitScrolling: true,
          onPageChanged: (value) =>
              context.read<TasksSingleDayPageCubit>().onPageChanged(
                    value: value,
                    userId: user?.id,
                  ),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: AppColors.grey, width: 0.5.h),
                    ),
                  ),
                  child: Text(
                    AppDateUtils.formatDate(state.selectedDate),
                    style: AppTextStyles.semibold12,
                  ).toCenter().paddingSymmetric(vertical: 5.h),
                ),
                Expanded(
                  child: SingleDayTaskGrid(
                    selectedDate: state.selectedDate,
                    onTaskShifted: (task) => cubit.editTask(task),
                    tasks: state.tasks,
                    currentUser: state.currentUser,
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TasksSingleDayPageCubit>(
      create: (context) =>
          getIt<TasksSingleDayPageCubit>()..init(userId: user?.id),
      child: this,
    );
  }
}
