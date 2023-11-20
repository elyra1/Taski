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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: Color(widget.task.color),
        borderRadius: BorderRadius.circular(5.r),
      ),
      width: widget.width,
      height: widget.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            SizedBox(width:150.w, child:Text(widget.task.title, style: AppTextStyles.bold16, overflow: TextOverflow.ellipsis,)),
              Row(
                children: [
              SvgPicture.asset(
                AppIcons.calendarIconNew,
                width: 15.w,
                height: 16.h,
              ),
              7.w.widthBox,
              Text(
                  "${format.format(widget.task.startTime.toDate())} - ${format.format(widget.task.endTime.toDate())}",
                  style: AppTextStyles.semibold14
              ),
            ]
            ),
        ]
      ),
    );
  }
}