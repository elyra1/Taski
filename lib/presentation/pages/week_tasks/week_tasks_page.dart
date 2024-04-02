import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/pages/week_tasks/cubit/week_tasks_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_task_grid.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_task_grid_helper.dart';

@RoutePage()
class WeekTasksPage extends StatefulWidget implements AutoRouteWrapper {
  final UserModel? user;
  const WeekTasksPage({Key? key, this.user}) : super(key: key);

  @override
  State<WeekTasksPage> createState() => _WeekTasksPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<WeekTasksPageCubit>(
      create: (context) => getIt<WeekTasksPageCubit>(),
      child: this,
    );
  }
}

class _WeekTasksPageState extends State<WeekTasksPage> {
  int page = 0;
  DateTime selectedWeek = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WeekTasksPageCubit>();
    return PageView.builder(
      allowImplicitScrolling: true,
      onPageChanged: (value) {
        setState(() {
          selectedWeek = value - page > 0
              ? selectedWeek.add(const Duration(days: 7))
              : selectedWeek.subtract(const Duration(days: 7));
          page = value;
        });
      },
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 62.w,
                  child: Text(
                    AppDateUtils.getMonthString(selectedWeek),
                    style: AppTextStyles.medium12.copyWith(
                      color: AppColors.headblue,
                      fontSize: 10.sp,
                    ),
                  ).paddingOnly(left: 11.w),
                ),
                for (int i = 0; i < 7; i++)
                  SizedBox(
                    width: 44.5.w,
                    child: Column(
                      children: [
                        Text(
                          WeekTaskGridHelper.getDays()[i],
                          style: AppTextStyles.medium12
                              .copyWith(color: AppColors.headblue),
                        ),
                        Text(
                          WeekTaskGridHelper.getWeekDates(selectedWeek)[i]
                              .day
                              .toString(),
                          style: AppTextStyles.medium12
                              .copyWith(color: AppColors.headblue),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            Expanded(
              child: StreamBuilder(
                stream: cubit.getTasks(userId: widget.user?.id),
                builder: (context, snapshot) {
                  return WeekTaskGrid(
                    tasks: cubit.getTasksThisWeek(
                        snapshot.data ?? [], selectedWeek),
                    onTaskShifted: (task) => cubit.editTask(task),
                    onDateChanged: (_) {},
                    selectedWeek: selectedWeek,
                    isDragAvaliable: widget.user == null,
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
