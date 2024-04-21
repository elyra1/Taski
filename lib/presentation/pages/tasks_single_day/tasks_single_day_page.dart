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
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_task_grid.dart';

@RoutePage()
class TasksSingleDayPage extends StatefulWidget implements AutoRouteWrapper {
  final UserModel? user;
  const TasksSingleDayPage({Key? key, this.user}) : super(key: key);

  @override
  State<TasksSingleDayPage> createState() => _TasksSingleDayPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TasksSingleDayPageCubit>(
      create: (context) => getIt<TasksSingleDayPageCubit>(),
      child: this,
    );
  }
}

class _TasksSingleDayPageState extends State<TasksSingleDayPage> {
  DateTime selectedDate = DateTime.now();
  int page = 0;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasksSingleDayPageCubit>();
    return PageView.builder(
      allowImplicitScrolling: true,
      onPageChanged: (value) {
        setState(() {
          selectedDate = value - page > 0
              ? selectedDate.add(const Duration(days: 1))
              : selectedDate.subtract(const Duration(days: 1));
          page = value;
        });
      },
      itemBuilder: (context, index) {
        return StreamBuilder(
          stream:
              cubit.getTasks(dayOfTasks: selectedDate, userId: widget.user?.id),
          builder: (context, snapshot) {
            final tasks = snapshot.data;
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
                    AppDateUtils.formatDate(selectedDate),
                    style: AppTextStyles.semibold12,
                  ).toCenter().paddingSymmetric(vertical: 5.h),
                ),
                Expanded(
                  child: SingleDayTaskGrid(
                    isDragAvaliable: widget.user == null,
                    selectedDate: selectedDate,
                    onDateChanged: (date) =>
                        setState(() => selectedDate = date),
                    onTaskShifted: (task) => cubit.editTask(task),
                    tasks: tasks ?? [],
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
