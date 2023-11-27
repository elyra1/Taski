import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

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

  String formatDate(DateTime date) {
    String dayOfWeek = '';
    switch (date.weekday) {
      case 1:
        dayOfWeek = 'Понедельник';
        break;
      case 2:
        dayOfWeek = 'Вторник';
        break;
      case 3:
        dayOfWeek = 'Среда';
        break;
      case 4:
        dayOfWeek = 'Четверг';
        break;
      case 5:
        dayOfWeek = 'Пятница';
        break;
      case 6:
        dayOfWeek = 'Суббота';
        break;
      case 7:
        dayOfWeek = 'Воскресенье';
        break;
    }

    String month = '';
    switch (date.month) {
      case 1:
        month = 'января';
        break;
      case 2:
        month = 'февраля';
        break;
      case 3:
        month = 'марта';
        break;
      case 4:
        month = 'апреля';
        break;
      case 5:
        month = 'мая';
        break;
      case 6:
        month = 'июня';
        break;
      case 7:
        month = 'июля';
        break;
      case 8:
        month = 'августа';
        break;
      case 9:
        month = 'сентября';
        break;
      case 10:
        month = 'октября';
        break;
      case 11:
        month = 'ноября';
        break;
      case 12:
        month = 'декабря';
        break;
    }

    return '$dayOfWeek, ${date.day} $month ${date.year} г.';
  }

  String toHHMM(DateTime dateTime) {
    return '${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';
  }

  DateTime startTime = DateTime.now();
  DateTime endTime = DateTime.now().add(const Duration(minutes: 30));

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
                    formatDate(startTime),
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
                    toHHMM(startTime),
                    style: AppTextStyles.semibold14,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 15.w),
            15.h.heightBox,
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
                    formatDate(endTime),
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
                    toHHMM(endTime),
                    style: AppTextStyles.semibold14,
                  ),
                ),
              ],
            ).paddingSymmetric(horizontal: 15.w),
            20.h.heightBox,
            // AppTextField(
            //   title: 'Дата',
            //   hintText: 'Выберете дату',
            //   width: 345.w,
            //   height: 70.h,
            // ),
            // 20.h.heightBox,
            // Row(
            //   children: [
            //     AppTextField(
            //       title: 'Начало',
            //       hintText: 'Выберете время',
            //       width: 162.w,
            //       height: 70.h,
            //     ),
            //     SizedBox(
            //       width: 21.w,
            //     ),
            //     AppTextField(
            //       title: 'Конец',
            //       hintText: 'Выберете время',
            //       width: 162.w,
            //       height: 70.h,
            //     ),
            //   ],
            // ),
            //20.h.heightBox,
            Divider(
              thickness: 1.h,
              color: AppColors.grey,
            ),
            20.h.heightBox,
            Text(
              'Выберете цвет',
              style: AppTextStyles.semibold20.copyWith(fontSize: 18),
            ).paddingOnly(left: 15.w).alignAtCenterLeft(),
            5.h.heightBox,
            Row(
              children: [
                InkWell(
                  onTap: () => {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.headblue,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
                5.w.widthBox,
                InkWell(
                  onTap: () => {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.blue,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.headblue,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
                5.w.widthBox,
                InkWell(
                  onTap: () => {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.headblue,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
                5.w.widthBox,
                InkWell(
                  onTap: () => {},
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: AppColors.red,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.headblue,
                        width: 1.w,
                      ),
                    ),
                  ),
                ),
              ],
            ).paddingOnly(left: 15.w).alignAtCenterLeft(),
            20.h.heightBox,
            CustomButton(
              width: 129.w,
              height: 40.h,
              onPressed: () {
                final task = Task.getEmpty().copyWith(
                  title: titleController.text,
                  description: descriptionController.text,
                );
                log('${task.title} ${task.description}');
              },
              text: 'Сохранить',
            ).paddingOnly(right: 15.w).alignAtCenterRight(),
          ],
        ).toCenter(),
      ),
    );
  }
}
