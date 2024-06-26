import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';
import 'package:taski/presentation/widgets/task_grids/current_time_indicator.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_markup.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_task_grid_helper.dart';

class SingleDayTaskGrid extends StatefulWidget {
  final List<Task> tasks;
  final DateTime selectedDate;
  final void Function(Task task) onTaskShifted;
  final UserModel currentUser;

  const SingleDayTaskGrid({
    Key? key,
    required this.tasks,
    required this.onTaskShifted,
    required this.selectedDate,
    required this.currentUser,
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

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.jumpTo(
        SingleDayTaskGridHelper.findPaddingTop(DateTime.now()) - 50.h > 0
            ? SingleDayTaskGridHelper.findPaddingTop(DateTime.now()) - 50.h
            : 0,
      ),
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
          setState(
            () => positions[selectedIndex] += notification.scrollDelta ?? 0,
          );
        }
        return false;
      },
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Stack(
          children: [
            const SingleDayMarkup().paddingOnly(top: 42.5.h),
            if (widget.selectedDate.isToday) const CurrentTimeIndicator(),
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
                      onTap: () => context.router.push(
                        TaskPage(task: widget.tasks[startMove.indexOf(true)]),
                      ),
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
              for (int index = 0; index < widget.tasks.length; index++) ...[
                Positioned(
                  key: keys[index],
                  top: positions[index],
                  right: 13.w,
                  child: GestureDetector(
                    onLongPressStart: (_) => _onTaskLongPressStart(index),
                    onLongPressEnd: startMove[index]
                        ? (_) => _onTaskLongPressEnd(index)
                        : null,
                    onLongPressMoveUpdate: startMove[index]
                        ? (details) =>
                            _onTaskLongPressMoveUpdate(details, index)
                        : null,
                    child: TaskCard(
                      isShifting: startMove[index],
                      task: widget.tasks[index],
                      onTap: () => context.router
                          .push(TaskPage(task: widget.tasks[index])),
                      height: SingleDayTaskGridHelper.findHeight(
                        widget.tasks[index],
                      ).$2,
                      width: 300.w,
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
                    color: Color(widget.tasks[startMove.indexOf(true)].color),
                  ),
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
                    color: Color(widget.tasks[startMove.indexOf(true)].color),
                  ),
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

  void _onTaskLongPressStart(int index) {
    return setState(
      () {
        final isAuthor = widget.currentUser.id == widget.tasks[index].authorId;
        startMove[index] = isAuthor;
      },
    );
  }

  void _onTaskLongPressMoveUpdate(
      LongPressMoveUpdateDetails details, int index) {
    return setState(
      () {
        if (previousOffsetDy == -1) {
          previousOffsetDy = details.globalPosition.dy;
        }
        if (positions[index] - _scrollController.position.pixels < 10) {
          needScroll = AxisDirection.up;
          selectedIndex = index;
        } else if (700 -
                (details.globalPosition.dy +
                    SingleDayTaskGridHelper.findHeight(widget.tasks[index])
                        .$2) <
            100) {
          needScroll = AxisDirection.down;
          selectedIndex = index;
        } else {
          needScroll = null;
          _scrollController.jumpTo(_scrollController.position.pixels);
        }
        if (needScroll != null) {
          final hours = positions[index] ~/ 100.h;
          final duration =
              needScroll == AxisDirection.up ? hours ~/ 4 : (24 - hours) ~/ 4;
          _scrollController.animateTo(
            needScroll == AxisDirection.up ? 20.h : 100.h * 24 - 20.h,
            duration: Duration(seconds: duration > 0 ? duration : 1),
            curve: Curves.linear,
          );
        }
        currentDelta += details.globalPosition.dy - previousOffsetDy;
        previousOffsetDy = details.globalPosition.dy;

        if (currentDelta.abs() > 100.h / 4) {
          if (SingleDayTaskGridHelper.shouldMove(
            positions[index],
            currentDelta,
            widget.tasks[index],
          )) {
            positions[index] += currentDelta > 0 ? 100.h / 4 : -100.h / 4;
            currentDelta = 0;
          }
        }
      },
    );
  }

  void _onTaskLongPressEnd(int index) {
    return setState(
      () {
        final newTask = widget.tasks[index].copyWith(
          startTime: SingleDayTaskGridHelper.countPeriod(
            widget.tasks[index],
            positions[index],
          ).$1,
          endTime: SingleDayTaskGridHelper.countPeriod(
            widget.tasks[index],
            positions[index],
          ).$2,
        );
        widget.onTaskShifted(newTask);
        selectedIndex = -1;
        needScroll = null;
        startMove[index] = false;
        _scrollController.jumpTo(_scrollController.position.pixels);
      },
    );
  }
}
