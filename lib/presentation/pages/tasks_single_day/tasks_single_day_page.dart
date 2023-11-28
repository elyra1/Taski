import 'package:auto_route/auto_route.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';
import 'package:taski/presentation/widgets/buttons/circle_add_button.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_task_grid.dart';

@RoutePage()
class TasksSingleDayPage extends StatefulWidget implements AutoRouteWrapper {
  const TasksSingleDayPage({Key? key}) : super(key: key);

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
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasksSingleDayPageCubit>();
    return Scaffold(
      appBar: const MainAppBar(),
      resizeToAvoidBottomInset: false,
      floatingActionButton: CircleAddButton(onTap: () async {
        setState(() {
          isLoading = true;
        });
        await cubit.addTask(
          Task.getEmpty().copyWith(
            startTime: Timestamp.fromDate(
              DateTime(2023, 11, 26, 20),
            ),
            endTime: Timestamp.fromDate(
              DateTime(2023, 11, 26, 23),
            ),
          ),
        );
        setState(() {
          isLoading = false;
        });
      }),
      body: StreamBuilder(
        stream: cubit.getTasks(userId: "4234234"),
        builder: (context, snapshot) {
          final tasks = snapshot.data;
          return Stack(
            children: [
              if (snapshot.connectionState == ConnectionState.waiting ||
                  isLoading) ...[
                LinearProgressIndicator(
                  minHeight: 2.h,
                  color: AppColors.headblue,
                ),
              ],
              if (snapshot.data != null &&
                  snapshot.connectionState == ConnectionState.active) ...[
                SingleDayTaskGrid(
                  onTaskShifted: (task) => cubit.editTask(task),
                  tasks: tasks!,
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}
