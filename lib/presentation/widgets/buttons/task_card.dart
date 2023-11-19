import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:taski/domain/entities/task_entity.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_icons.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class TaskCard extends StatefulWidget {
  final double? width;
  final double? height;
  final TaskEntity task;

  const TaskCard({
    super.key,
    this.width,
    this.height,
    required this.task,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final DateFormat format = DateFormat.Hm();
  final String category = 'Category';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Color(widget.task.color),
        borderRadius: BorderRadius.circular(5.r),
      ),
      width: widget.width,
      height: widget.height,
      child: Row(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.task.title, style: AppTextStyles.semibold22),
              2.h.heightBox,
              Row(
                children: [
                  SvgPicture.asset(
                    AppIcons.clockIcon,
                    width: 18.w,
                    height: 18.h,
                  ),
                  5.w.widthBox,
                  Text(
                      "${format.format(widget.task.startTime.toDate())} - ${format.format(widget.task.endTime.toDate())}",
                      style: AppTextStyles.semibold14)
                ],
              ),
              5.h.heightBox,
              if (widget.task.description != null) ...[
                Flexible(
                  child: Text(
                    widget.task.description!,
                    style: AppTextStyles.semibold12,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                  ),
                ),
              ]
            ],
          ),
          5.w.widthBox,
          if (category != null) ...[
            Container(
              width: 1.w,
              height: 70.h,
              decoration: const BoxDecoration(
                color: AppColors.headblue,
              ),
            ),
            5.w.widthBox,
            RotatedBox(
              quarterTurns: -1,
              child: Text(category),
            ),
          ]
        ],
      ),
    );
  }
}
