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

  final DateFormat format = DateFormat.yMd();

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
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 5.h),
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
            Row(
              children: [
                Text(
                  'Выберете цвет',
                  style: AppTextStyles.semibold20.copyWith(fontSize: 18),
                ),
              ],
            ),
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
            ),
            20.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
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
                ),
              ],
            ),
          ],
        ).toCenter(),
      ),
    );
  }
}
