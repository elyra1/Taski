import 'dart:developer';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';

class SingleDayTaskGrid extends StatefulWidget {
  final List<Task> tasks;
  final void Function(Task task) onTaskShifted;

  const SingleDayTaskGrid({
    Key? key,
    required this.tasks,
    required this.onTaskShifted,
  }) : super(key: key);

  @override
  State<SingleDayTaskGrid> createState() => _SingleDayTaskGridState();
}

class _SingleDayTaskGridState extends State<SingleDayTaskGrid> {
  final ScrollController _scrollController = ScrollController();
  List<double> positions = [];
  List<bool> startMove = [];
  double currentDelta = 0;

  @override
  void initState() {
    setState(() {
      positions = widget.tasks.map((e) => findHeight(e).$1).toList();
      startMove = widget.tasks.map((e) => false).toList();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SingleDayTaskGrid oldWidget) {
    setState(() {
      positions = widget.tasks.map((e) => findHeight(e).$1).toList();
      startMove = widget.tasks.map((e) => false).toList();
    });
    super.didUpdateWidget(oldWidget);
  }

  ///Возвращает высоту карточки задачи и отступ от края
  (double, double) findHeight(Task task) {
    final diff = task.endTime.toDate().difference(task.startTime.toDate());
    final height = (diff.inMinutes / 60) * 100.h;
    final top = task.startTime.toDate().hour * (100.h) +
        (task.startTime.toDate().minute / 60) * (100.h);
    return (top + 50.h, height);
  }

  ///Возвращает startTime и endTime по позиции на скролле
  (Timestamp, Timestamp) countPeriod(Task task, double position) {
    final cardHeight = findHeight(task).$2;
    final endTimePos = position + cardHeight;
    final startTime = Timestamp.fromDate(
      task.startTime.toDate().copyWith(
            hour: position ~/ 100.h,
            minute: ((-50.h + position - (position ~/ 100.h) * 100.h) /
                    (100.h / 60))
                .round(),
          ),
    );
    final endTime = Timestamp.fromDate(
      task.startTime.toDate().copyWith(
            hour: endTimePos ~/ 100.h,
            minute: ((endTimePos - 50.h - (endTimePos ~/ 100.h) * 100.h) /
                    (100.h / 60))
                .round(),
          ),
    );
    return (startTime, endTime);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Stack(
        children: [
          Column(
            children: [
              for (int i = 0; i < 24; i++) ...[
                SizedBox(
                  height: 100.h,
                  child: Row(
                    children: [
                      12.w.widthBox,
                      SizedBox(
                        width: 35.w,
                        child: Text(
                          '$i:00',
                          style: AppTextStyles.medium12
                              .copyWith(color: AppColors.headblue),
                        ),
                      ),
                      8.w.widthBox,
                      Expanded(
                        child: Container(
                          height: 0.5.h,
                          width: double.maxFinite,
                          color: AppColors.grey,
                        ),
                      ),
                    ],
                  ).alignAtTopCenter(),
                ),
              ],
            ],
          ).paddingOnly(top: 42.5.h),
          if (widget.tasks.isNotEmpty) ...[
            for (int i = 0; i < widget.tasks.length; i++) ...[
              Builder(
                builder: (context) {
                  bool shouldMove(DragUpdateDetails details) {
                    return (positions[i] >= 53.5.h || details.delta.dy > 0) &&
                        (positions[i] + findHeight(widget.tasks[i]).$2 <
                                100.h * 24 + 50.h ||
                            details.delta.dy < 0);
                  }

                  return Positioned(
                    top: positions[i],
                    right: 13.w,
                    child: GestureDetector(
                      onLongPressUp: () {
                        setState(() {
                          startMove[i] = !startMove[i];
                        });
                      },
                      onVerticalDragUpdate: startMove[i]
                          ? (details) {
                              if (shouldMove(details)) {
                                setState(() {
                                  currentDelta += details.delta.dy;
                                  if (currentDelta.abs() > 100.h / 4) {
                                    // шаг 15 минут
                                    positions[i] += currentDelta > 0
                                        ? 100.h / 4
                                        : -100.h / 4;
                                    currentDelta = 0;
                                  }
                                });
                              }
                            }
                          : null,
                      onVerticalDragEnd: (details) {
                        setState(
                          () {
                            if (startMove[i]) {
                              final newTask = widget.tasks[i].copyWith(
                                startTime:
                                    countPeriod(widget.tasks[i], positions[i])
                                        .$1,
                                endTime:
                                    countPeriod(widget.tasks[i], positions[i])
                                        .$2,
                              );
                              widget.onTaskShifted(newTask);
                            }

                            startMove[i] = false;
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: startMove[i]
                              ? [
                                  BoxShadow(
                                    color: AppColors.headblue,
                                    offset: Offset(0.0, 1.w),
                                    blurRadius: 6.r,
                                  ),
                                ]
                              : null,
                        ),
                        child: TaskCard(
                          task: widget.tasks[i],
                          onTap: () => log(widget.tasks[i].toString()),
                          height: findHeight(widget.tasks[i]).$2,
                          width: 300.w, //todo
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ],
          Positioned(
            left: 60.w,
            child: Container(
              color: AppColors.grey,
              width: 0.5.w,
              height: 100.5.h * 24 + 46.h,
            ),
          ),
        ],
      ),
    );
  }
}
