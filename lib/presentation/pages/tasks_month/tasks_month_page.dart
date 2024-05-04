import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/pages/tasks_month/cubit/tasks_month_page_cubit.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/cards/abbreviated_task_card.dart';

@RoutePage()
class TasksMonthPage extends StatefulWidget implements AutoRouteWrapper {
  final UserModel? user;
  const TasksMonthPage({Key? key, this.user}) : super(key: key);

  @override
  State<TasksMonthPage> createState() => _TasksMonthPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TasksMonthPageCubit>(
      create: (context) =>
          getIt<TasksMonthPageCubit>()..getTasks(userId: user?.id),
      child: this,
    );
  }
}

class _TasksMonthPageState extends State<TasksMonthPage> {
  bool isLoading = false;
  DateTime _selectedDay = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          headerStyle: const HeaderStyle(
            formatButtonVisible: false,
            titleCentered: true,
          ),
          locale: 'ru_RU',
          rowHeight: 45.h,
          weekNumbersVisible: false,
          focusedDay: _selectedDay,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          firstDay: DateTime(DateTime.now().year),
          lastDay: DateTime(DateTime.now().year + 1),
          onDaySelected: (selectedDay, focusedDay) {
            setState(() {
              _selectedDay = selectedDay;
            });
            context.read<TasksMonthPageCubit>().getTasks(
                  userId: widget.user?.id,
                  dayOfTasks: selectedDay,
                );
          },
          onFormatChanged: (format) {},
        ),
        BlocBuilder<TasksMonthPageCubit, TasksMonthPageState>(
          buildWhen: (previous, current) {
            return previous.tasks != current.tasks;
          },
          builder: (context, state) {
            return Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                child: Column(
                  children: [
                    if (state.tasks.isEmpty) ...[
                      Text(
                        'В этот день не назначено задач',
                        style: AppTextStyles.regular12,
                      ).toCenter().paddingOnly(top: 50.h),
                    ] else
                      for (Task task in state.tasks) ...[
                        AbbreviatedTaskCard(task: task)
                            .paddingSymmetric(vertical: 5.h, horizontal: 3.w),
                      ]
                  ],
                ).paddingSymmetric(vertical: 30.h),
              ),
            );
          },
        )
      ],
    );
  }
}
