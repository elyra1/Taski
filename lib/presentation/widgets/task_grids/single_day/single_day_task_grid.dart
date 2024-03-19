import 'dart:developer';

import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_markup.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_task_grid_helper.dart';

class SingleDayTaskGrid extends StatefulWidget {
  final List<Task> tasks;
  final void Function(DateTime date) onDateChanged;
  final DateTime selectedDate;
  final void Function(Task task) onTaskShifted;

  const SingleDayTaskGrid({
    Key? key,
    required this.tasks,
    required this.onTaskShifted,
    required this.onDateChanged,
    required this.selectedDate,
  }) : super(key: key);

  @override
  State<SingleDayTaskGrid> createState() => _SingleDayTaskGridState();
}

class _SingleDayTaskGridState extends State<SingleDayTaskGrid> {
  final _scrollController = ScrollController();
  List<double> positions = [];
  List<bool> startMove = [];
  double currentDelta = 0;
  double previousOffsetDy = -1;
  AxisDirection? needScroll;
  int selectedIndex = -1;
  List<GlobalKey> keys = [];

  @override
  void initState() {
    setState(
      () {
        positions = widget.tasks
            .map((e) => SingleDayTaskGridHelper.findHeight(e).$1)
            .toList();
        startMove = widget.tasks.map((e) => false).toList();
        keys = widget.tasks.map((e) => GlobalKey()).toList();
      },
    );

    super.initState();
  }

  @override
  void didUpdateWidget(covariant SingleDayTaskGrid oldWidget) {
    setState(() {
      positions = widget.tasks
          .map((e) => SingleDayTaskGridHelper.findHeight(e).$1)
          .toList();
      startMove = widget.tasks.map((e) => false).toList();
      keys = widget.tasks.map((e) => GlobalKey()).toList();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollUpdateNotification>(
      onNotification: (ScrollUpdateNotification notification) {
        if (selectedIndex != -1) {
          log("POSITION: ${positions[selectedIndex]} SCROLL: ${_scrollController.position.pixels}");
          setState(
            () {
              //currentDelta += (notification.scrollDelta ?? 0);
              //if (currentDelta.abs() > 100.h / 4) {
              // шаг 15 минут
              // positions[selectedIndex] +=
              //     currentDelta > 0 ? 100.h / 4 : -100.h / 4;
              positions[selectedIndex] += notification.scrollDelta ?? 0;
              //currentDelta = 0;
              //}
            },
          );
        }

        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            const SingleDayMarkup().paddingOnly(top: 42.5.h),
            if (startMove.contains(true))
              Positioned(
                top: SingleDayTaskGridHelper.findHeight(
                  widget.tasks[startMove.indexOf(true)],
                ).$1,
                right: 13.w,
                child: Stack(
                  children: [
                    TaskCard(
                      width: 300.w,
                      height: SingleDayTaskGridHelper.findHeight(
                        widget.tasks[startMove.indexOf(true)],
                      ).$2,
                      task: widget.tasks[startMove.indexOf(true)],
                      onTap: () {},
                    ),
                    Container(
                      color: AppColors.grey.withOpacity(0.6),
                      width: 300.w,
                      height: SingleDayTaskGridHelper.findHeight(
                        widget.tasks[startMove.indexOf(true)],
                      ).$2,
                    )
                  ],
                ),
              ),
            if (widget.tasks.isNotEmpty) ...[
              for (int i = 0; i < widget.tasks.length; i++) ...[
                Positioned(
                  key: keys[i],
                  top: positions[i],
                  right: 13.w,
                  child: GestureDetector(
                    onLongPressStart: (details) {
                      setState(() {
                        startMove[i] = true;
                      });
                    },
                    onLongPressEnd: startMove[i]
                        ? (details) {
                            setState(
                              () {
                                final newTask = widget.tasks[i].copyWith(
                                  startTime:
                                      SingleDayTaskGridHelper.countPeriod(
                                              widget.tasks[i], positions[i])
                                          .$1,
                                  endTime: SingleDayTaskGridHelper.countPeriod(
                                          widget.tasks[i], positions[i])
                                      .$2,
                                );
                                //widget.onTaskShifted(newTask);
                                selectedIndex = -1;
                                needScroll = null;
                                startMove[i] = false;
                                _scrollController
                                    .jumpTo(_scrollController.position.pixels);
                              },
                            );
                          }
                        : null,
                    onLongPressMoveUpdate: (details) {
                      setState(
                        () {
                          if (previousOffsetDy == -1) {
                            previousOffsetDy = details.globalPosition.dy;
                          }
                          if (positions[i] - _scrollController.position.pixels <
                              10) {
                            needScroll = AxisDirection.up;
                            selectedIndex = i;
                          } else if (700 -
                                  (details.globalPosition.dy +
                                      SingleDayTaskGridHelper.findHeight(
                                              widget.tasks[i])
                                          .$2) <
                              100) {
                            needScroll = AxisDirection.down;
                            selectedIndex = i;
                          } else {
                            needScroll = null;
                            _scrollController
                                .jumpTo(_scrollController.position.pixels);
                          }
                          if (needScroll != null) {
                            final hours = positions[i] ~/ 100.h;
                            final duration = needScroll == AxisDirection.up
                                ? hours ~/ 4
                                : (24 - hours) ~/ 4;
                            _scrollController.animateTo(
                              needScroll == AxisDirection.up ? 0 : 100.h * 24,
                              duration: Duration(
                                  seconds: duration > 0 ? duration : 1),
                              curve: Curves.linear,
                            );
                          }
                          currentDelta +=
                              details.globalPosition.dy - previousOffsetDy;
                          previousOffsetDy = details.globalPosition.dy;

                          if (currentDelta.abs() > 100.h / 4) {
                            // шаг 15 минут
                            positions[i] +=
                                currentDelta > 0 ? 100.h / 4 : -100.h / 4;
                            currentDelta = 0;
                          }
                        },
                      );
                    },
                    child: TaskCard(
                      isShifting: startMove[i],
                      task: widget.tasks[i],
                      onTap: () {},
                      height:
                          SingleDayTaskGridHelper.findHeight(widget.tasks[i])
                              .$2,
                      width: 300.w, //todo
                    ),
                  ),
                ),
              ],
            ],
            if (startMove.contains(true)) ...[
              Positioned(
                left: 12.w,
                top: positions[startMove.indexOf(true)] - 7.h,
                child: Text(
                  SingleDayTaskGridHelper.getTimeHHMM(
                    widget.tasks[startMove.indexOf(true)],
                    positions[startMove.indexOf(true)],
                  ).$1,
                  style: AppTextStyles.medium12.copyWith(
                      color:
                          Color(widget.tasks[startMove.indexOf(true)].color)),
                ),
              ),
              Positioned(
                left: 12.w,
                top: positions[startMove.indexOf(true)] +
                    SingleDayTaskGridHelper.findHeight(
                      widget.tasks[startMove.indexOf(true)],
                    ).$2 -
                    7.h,
                child: Text(
                  SingleDayTaskGridHelper.getTimeHHMM(
                    widget.tasks[startMove.indexOf(true)],
                    positions[startMove.indexOf(true)],
                  ).$2,
                  style: AppTextStyles.medium12.copyWith(
                      color:
                          Color(widget.tasks[startMove.indexOf(true)].color)),
                ),
              ),
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
      ),
    );
  }
}
