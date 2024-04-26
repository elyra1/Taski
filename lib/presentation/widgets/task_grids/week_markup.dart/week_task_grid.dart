import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';
import 'package:taski/presentation/widgets/task_grids/single_day/single_day_task_grid_helper.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_markup.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_task_grid_helper.dart';

class WeekTaskGrid extends StatefulWidget {
  final List<Task> tasks;
  final void Function(Task task) onTaskShifted;
  final DateTime selectedWeek;
  final UserModel currentUser;

  const WeekTaskGrid({
    Key? key,
    required this.tasks,
    required this.onTaskShifted,
    required this.selectedWeek,
    required this.currentUser,
  }) : super(key: key);

  @override
  State<WeekTaskGrid> createState() => _WeekTaskGridState();
}

class _WeekTaskGridState extends State<WeekTaskGrid> {
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
            .map((e) => WeekTaskGridHelper.findHeight(e).$1)
            .toList();
        startMove = widget.tasks.map((e) => false).toList();
        keys = widget.tasks.map((e) => GlobalKey()).toList();
      },
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollController.jumpTo(
        SingleDayTaskGridHelper.findPaddingTop(DateTime.now()) - 50.h > 0
            ? SingleDayTaskGridHelper.findPaddingTop(DateTime.now()) - 50.h
            : 0,
      );
    });

    super.initState();
  }

  @override
  void didUpdateWidget(covariant WeekTaskGrid oldWidget) {
    setState(() {
      positions =
          widget.tasks.map((e) => WeekTaskGridHelper.findHeight(e).$1).toList();
      startMove = widget.tasks.map((e) => false).toList();
      keys = widget.tasks.map((e) => GlobalKey()).toList();
    });
    super.didUpdateWidget(oldWidget);
  }

  double taskWidth = 45.w;

  @override
  Widget build(BuildContext context) {
    return NotificationListener(
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
            WeekMarkup(selectedDate: widget.selectedWeek),
            if (startMove.contains(true))
              Positioned(
                top: WeekTaskGridHelper.findHeight(
                  widget.tasks[startMove.indexOf(true)],
                ).$1,
                left: WeekTaskGridHelper.findPaddingLeft(
                  widget.tasks[startMove.indexOf(true)],
                ),
                child: Stack(
                  children: [
                    TaskCard(
                      isWeekView: true,
                      width: taskWidth,
                      height: WeekTaskGridHelper.findHeight(
                        widget.tasks[startMove.indexOf(true)],
                      ).$2,
                      task: widget.tasks[startMove.indexOf(true)],
                      onTap: () => context.router.push(
                        TaskPage(
                          task: widget.tasks[startMove.indexOf(true)],
                        ),
                      ),
                    ),
                    Container(
                      color: AppColors.grey.withOpacity(0.6),
                      width: taskWidth,
                      height: WeekTaskGridHelper.findHeight(
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
                  left: WeekTaskGridHelper.findPaddingLeft(
                    widget.tasks[index],
                  ),
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
                      isWeekView: true,
                      isShifting: startMove[index],
                      task: widget.tasks[index],
                      onTap: () => context.router
                          .push(TaskPage(task: widget.tasks[index])),
                      height:
                          WeekTaskGridHelper.findHeight(widget.tasks[index]).$2,
                      width: taskWidth,
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
                  WeekTaskGridHelper.getTimeHHMM(
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
                    WeekTaskGridHelper.findHeight(
                      widget.tasks[startMove.indexOf(true)],
                    ).$2 -
                    7.h,
                child: Text(
                  WeekTaskGridHelper.getTimeHHMM(
                    widget.tasks[startMove.indexOf(true)],
                    positions[startMove.indexOf(true)],
                  ).$2,
                  style: AppTextStyles.medium12.copyWith(
                    color: Color(widget.tasks[startMove.indexOf(true)].color),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  void _onTaskLongPressStart(int i) {
    return setState(() {
      final isAuthor = widget.currentUser.id == widget.tasks[i].authorId;
      startMove[i] = isAuthor;
    });
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
                    WeekTaskGridHelper.findHeight(widget.tasks[index]).$2) <
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
            needScroll == AxisDirection.up ? 0.h : 100.h * 24 - 20.h,
            duration: Duration(seconds: duration > 0 ? duration : 1),
            curve: Curves.linear,
          );
        }
        currentDelta += details.globalPosition.dy - previousOffsetDy;
        previousOffsetDy = details.globalPosition.dy;

        if (currentDelta.abs() > 100.h / 4) {
          if (WeekTaskGridHelper.shouldMove(
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
          startTime: WeekTaskGridHelper.countPeriod(
            widget.tasks[index],
            positions[index],
          ).$1,
          endTime: WeekTaskGridHelper.countPeriod(
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
