import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/category.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/task_page/cubit/task_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/cards/category_animation_card.dart';

@RoutePage()
class TaskPage extends StatelessWidget implements AutoRouteWrapper {
  final Task task;
  const TaskPage({Key? key, required this.task}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: AppColors.headblue,
          onPressed: context.router.pop,
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: AppColors.headblue,
            width: double.maxFinite,
            height: 1.h,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.router.push(CreateTaskPage(task: task)),
            icon: const Icon(
              Icons.edit,
              color: AppColors.headblue,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: 15.w,
          vertical: 22.h,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              task.title,
              style: AppTextStyles.semibold24,
            ),
            15.h.heightBox,
            if (task.description != null)
              Text(
                task.description!,
                style: AppTextStyles.semibold14,
              ),
            20.h.heightBox,
            if (task.category != null)
              SizedBox(
                height: 30.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Категория",
                      style: AppTextStyles.semibold18,
                    ),
                    if (task.category != null)
                      FutureBuilder(
                        future: context
                            .read<TaskPageCubit>()
                            .getCategory(task.category!),
                        builder: (context, snapshot) {
                          if (snapshot.data == null) {
                            return SizedBox(
                              width: 200.w,
                              child: const LinearProgressIndicator(
                                color: AppColors.headblue,
                              ).paddingOnly(top: 25.h),
                            );
                          }
                          return CategoryAnimation(
                            category: snapshot.data,
                          );
                        },
                      ),
                  ],
                ),
              ),
            20.h.heightBox,
            Divider(
              color: AppColors.grey,
              thickness: 1.h,
            ),
            20.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppDateUtils.formatDate(task.startTime.toDate()),
                  style: AppTextStyles.semibold14,
                ),
                Column(
                  children: [
                    Text(
                      AppDateUtils.toHHMM(task.startTime.toDate()),
                      style: AppTextStyles.semibold14,
                    ),
                    15.h.heightBox,
                    Text(
                      AppDateUtils.toHHMM(task.endTime.toDate()),
                      style: AppTextStyles.semibold14,
                    ),
                  ],
                )
              ],
            ),
            20.h.heightBox,
            Divider(
              color: AppColors.grey,
              thickness: 1.h,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<TaskPageCubit>(
      create: (context) => getIt<TaskPageCubit>(),
      child: this,
    );
  }
}
