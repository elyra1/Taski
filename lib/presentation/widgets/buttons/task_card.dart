import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class TaskCard extends StatefulWidget {
  final VoidCallback onTap;
  final double? width;
  final double? height;
  final Task task;

  const TaskCard({
    super.key,
    this.width,
    this.height,
    required this.task,
    required this.onTap,
  });

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  final DateFormat format = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Material(
        color: Color(widget.task.color),
        borderRadius: BorderRadius.circular(5.r),
        child: InkWell(
          onTap: widget.onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  widget.task.title,
                  style: AppTextStyles.semibold22,
                  softWrap: true,
                ),
              ),
              if (widget.task.description != null &&
                  (widget.height ?? 135.h) > 50.h) ...[
                Expanded(
                  flex: 2,
                  child: Text(
                    widget.task.description!,
                    style: AppTextStyles.semibold12,
                    softWrap: true,
                  ),
                ),
              ],
            ],
          ).paddingAll(4.r),
        ),
      ),
    );
  }
}
