import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
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
  DateTime selectedDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<TasksSingleDayPageCubit>();
    return Scaffold(
      appBar: MainAppBar(
        child: GestureDetector(
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: selectedDate,
              firstDate: DateTime.now(),
              lastDate: DateTime.now().copyWith(year: DateTime.now().year + 1),
            ).then((value) {
              setState(() => selectedDate = value ?? selectedDate);
            });
          },
          child: Text(
            AppDateUtils.formatDate(selectedDate),
            style: AppTextStyles.semibold14,
          ),
        ),
        onTap: () => showDialog(
          context: context,
          builder: (context) {
            return CustomButton(
              height: 50.h,
              width: 220.w,
              text: "Выйти из аккаунта",
              onPressed: () async {
                cubit.signOut().then(
                  (value) {
                    context.router.popUntilRoot();
                    context.router.replace(const SignInPage());
                  },
                );
              },
            ).toCenter();
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: StreamBuilder(
        stream: cubit.getTasks(dayOfTasks: selectedDate),
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
                  selectedDate: selectedDate,
                  onDateChanged: (date) => setState(() => selectedDate = date),
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
