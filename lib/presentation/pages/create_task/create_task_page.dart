import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/validation.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/items/color_pick_item.dart';

@RoutePage()
class CreateTaskPage extends StatefulWidget implements AutoRouteWrapper {
  const CreateTaskPage({Key? key}) : super(key: key);

  @override
  State<CreateTaskPage> createState() => _CreateTaskPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<CreateTaskCubit>(
      create: (context) => getIt<CreateTaskCubit>(),
      child: this,
    );
  }
}

class _CreateTaskPageState extends State<CreateTaskPage> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(minutes: 30));
  List<Color> colors = [
    AppColors.green,
    AppColors.blue,
    AppColors.red,
    AppColors.orange,
  ];
  Color selectedColor = AppColors.green;

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
        title: Text('Создать задачу', style: AppTextStyles.bold20),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Column(
          children: [
            15.h.heightBox,
            AppTextField(
              title: 'Название',
              hintText: 'Введите название задачи',
              width: 345.w,
              height: 70.h,
              controller: titleController,
              textInputAction: TextInputAction.next,
            ),
            20.h.heightBox,
            AppTextField(
              title: 'Описание',
              hintText: 'Введите описание задачи',
              width: 345.w,
              height: 70.h,
              controller: descriptionController,
            ),
            20.h.heightBox,
            Divider(
              thickness: 1.h,
              color: AppColors.grey,
            ),
            20.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: startTime,
                      firstDate: DateTime.now(),
                      lastDate: endTime,
                    ).then(
                      (value) => setState(() => startTime = value?.copyWith(
                              hour: startTime.hour, minute: startTime.minute) ??
                          startTime),
                    );
                  },
                  child: Text(
                    AppDateUtils.formatDate(startTime),
                    style: AppTextStyles.semibold14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showTimePicker(
                      context: context,
                      initialTime: TimeOfDay.fromDateTime(startTime),
                    ).then(
                      (value) => setState(
                        () => startTime = startTime.copyWith(
                          hour: value?.hour ?? startTime.hour,
                          minute: value?.minute ?? startTime.minute,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    AppDateUtils.toHHMM(startTime),
                    style: AppTextStyles.semibold14,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 15.w),
            25.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    showDatePicker(
                      context: context,
                      initialDate: endTime,
                      firstDate: startTime,
                      lastDate: DateTime.now()
                          .copyWith(year: DateTime.now().year + 1),
                    ).then(
                      (value) => setState(() => endTime = value?.copyWith(
                              hour: endTime.hour, minute: endTime.minute) ??
                          endTime),
                    );
                  },
                  child: Text(
                    AppDateUtils.formatDate(endTime),
                    style: AppTextStyles.semibold14,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.fromDateTime(endTime))
                        .then(
                      (value) => setState(
                        () => endTime = endTime.copyWith(
                          hour: value?.hour ?? endTime.hour,
                          minute: value?.minute ?? endTime.minute,
                        ),
                      ),
                    );
                  },
                  child: Text(
                    AppDateUtils.toHHMM(endTime),
                    style: AppTextStyles.semibold14,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 15.w),
            20.h.heightBox,
            Divider(
              thickness: 1.h,
              color: AppColors.grey,
            ),
            20.h.heightBox,
            Text(
              'Выберите цвет',
              style: AppTextStyles.semibold20.copyWith(fontSize: 18),
            ).paddingOnly(left: 15.w).alignAtCenterLeft(),
            5.h.heightBox,
            Row(
              children: [
                for (Color color in colors) ...[
                  ColorPickItem(
                    color: color,
                    onTap: () => setState(() => selectedColor = color),
                    isSelected: color == selectedColor,
                  ),
                  10.w.widthBox,
                ]
              ],
            ).paddingOnly(left: 15.w).alignAtCenterLeft(),
            20.h.heightBox,
            CustomButton(
              width: 129.w,
              height: 40.h,
              onPressed: () async {
                bool titleIsEmpty = titleController.text == '';
                bool startIsAfterEnd = startTime.isAfter(endTime);
                final task = Task(
                  title: titleController.text,
                  id: '',
                  authorId: '',
                  startTime: Timestamp.fromDate(startTime),
                  endTime: Timestamp.fromDate(endTime),
                  color: selectedColor.value,
                );
                if (titleIsEmpty) {
                  Validation.showAppSnackBar(
                    text: 'Название не может быть пустым.',
                    context: context,
                  );
                } else if (startIsAfterEnd) {
                  Validation.showAppSnackBar(
                    text:
                        'Время старта не может быть позже времени окончания задачи.',
                    context: context,
                  );
                } else {
                  final textError =
                      await context.read<CreateTaskCubit>().addTask(task);
                  if (textError != null && context.mounted) {
                    Validation.showAppSnackBar(
                      text: textError,
                      context: context,
                    );
                  } else {
                    if (context.mounted) {
                      context.router.pop();
                    }
                  }
                }
              },
              text: 'Сохранить',
            ).paddingOnly(right: 15.w).alignAtCenterRight(),
          ],
        ).toCenter(),
      ),
    );
  }
}
