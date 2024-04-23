import 'dart:async';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_task_grid_helper.dart';

class CurrentTimeIndicator extends StatefulWidget {
  const CurrentTimeIndicator({
    super.key,
  });

  @override
  State<CurrentTimeIndicator> createState() => _CurrentTimeIndicatorState();
}

class _CurrentTimeIndicatorState extends State<CurrentTimeIndicator> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final nextMinute =
        DateTime(now.year, now.month, now.day, now.hour, now.minute + 1);
    final delay = nextMinute.difference(now);
    Timer(
      delay,
      () {
        if (mounted) {
          setState(() {});
          _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
            setState(() {});
          });
        }
      },
    );
  }

  @override
  void dispose() {
    if (mounted) {
      _timer?.cancel();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 10.r,
          height: 10.r,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.elementblue,
          ),
        ),
        Expanded(
          child: Container(
            color: AppColors.elementblue,
            height: 1.h,
          ),
        )
      ],
    ).paddingOnly(
      top: SingleDayTaskGridHelper.findPaddingTop(DateTime.now()) + 42.5.h,
      left: 55.8.w,
    );
  }
}
