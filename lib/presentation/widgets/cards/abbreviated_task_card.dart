import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/utils/app_icons.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class AbbreviatedTaskCard extends StatelessWidget {
  final double? width;
  final double? height;
  final Task task;

  AbbreviatedTaskCard({
    super.key,
    this.width,
    this.height,
    required this.task,
  });
  final DateFormat format = DateFormat.Hm();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 18.0),
      decoration: BoxDecoration(
        color: Color(task.color),
        borderRadius: BorderRadius.circular(5.r),
      ),
      width: width,
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 150.w,
              child: Text(
                task.title,
                style: AppTextStyles.bold16,
                overflow: TextOverflow.ellipsis,
              )),
          Row(
            children: [
              SvgPicture.asset(
                AppIcons.calendarIconNew,
                width: 15.w,
                height: 16.h,
              ),
              7.w.widthBox,
              Text(
                  "${format.format(task.startTime.toDate())} - ${format.format(task.endTime.toDate())}",
                  style: AppTextStyles.semibold14),
            ],
          ),
        ],
      ),
    );
  }
}
