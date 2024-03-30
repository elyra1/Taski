import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_date_utils.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

@RoutePage()
class TaskPage extends StatelessWidget {
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
          )
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
                Text(
                  AppDateUtils.toHHMM(task.startTime.toDate()),
                  style: AppTextStyles.semibold14,
                ),
              ],
            ),
            25.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppDateUtils.formatDate(task.endTime.toDate()),
                  style: AppTextStyles.semibold14,
                ),
                Text(
                  AppDateUtils.toHHMM(task.endTime.toDate()),
                  style: AppTextStyles.semibold14,
                ),
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
}
