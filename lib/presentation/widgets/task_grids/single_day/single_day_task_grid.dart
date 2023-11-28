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
  List<double> positions = [];
  List<bool> startMove = [];
  double currentDelta = 0;

  @override
  void initState() {
    setState(() {
      positions = widget.tasks
          .map((e) => SingleDayTaskGridHelper.findHeight(e).$1)
          .toList();
      startMove = widget.tasks.map((e) => false).toList();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant SingleDayTaskGrid oldWidget) {
    setState(() {
      positions = widget.tasks
          .map((e) => SingleDayTaskGridHelper.findHeight(e).$1)
          .toList();
      startMove = widget.tasks.map((e) => false).toList();
    });
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                top: positions[i],
                right: 13.w,
                child: GestureDetector(
                  onLongPress: () =>
                      setState(() => startMove[i] = !startMove[i]),
                  onVerticalDragUpdate: startMove[i]
                      ? (details) {
                          if (SingleDayTaskGridHelper.shouldMove(
                            positions[i],
                            details.delta.dy,
                            widget.tasks[i],
                          )) {
                            setState(() {
                              currentDelta += details.delta.dy;
                              if (currentDelta.abs() > 100.h / 4) {
                                // шаг 15 минут
                                positions[i] +=
                                    currentDelta > 0 ? 100.h / 4 : -100.h / 4;
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
                            startTime: SingleDayTaskGridHelper.countPeriod(
                                    widget.tasks[i], positions[i])
                                .$1,
                            endTime: SingleDayTaskGridHelper.countPeriod(
                                    widget.tasks[i], positions[i])
                                .$2,
                          );
                          widget.onTaskShifted(newTask);
                        }
                      },
                    );
                  },
                  child: TaskCard(
                    isShifting: startMove[i],
                    task: widget.tasks[i],
                    onTap: () {},
                    height:
                        SingleDayTaskGridHelper.findHeight(widget.tasks[i]).$2,
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
              child: Row(
                children: [
                  Text(
                    SingleDayTaskGridHelper.getTimeHHMM(
                      widget.tasks[startMove.indexOf(true)],
                      positions[startMove.indexOf(true)],
                    ).$1,
                    style: AppTextStyles.medium12.copyWith(
                        color:
                            Color(widget.tasks[startMove.indexOf(true)].color)),
                  ),
                  5.w.widthBox,
                  Container(
                    height: 1.h,
                    width: 335.w,
                    color: Color(widget.tasks[startMove.indexOf(true)].color),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 12.w,
              top: positions[startMove.indexOf(true)] +
                  SingleDayTaskGridHelper.findHeight(
                    widget.tasks[startMove.indexOf(true)],
                  ).$2 -
                  7.h,
              child: Row(
                children: [
                  Text(
                    SingleDayTaskGridHelper.getTimeHHMM(
                      widget.tasks[startMove.indexOf(true)],
                      positions[startMove.indexOf(true)],
                    ).$2,
                    style: AppTextStyles.medium12.copyWith(
                        color:
                            Color(widget.tasks[startMove.indexOf(true)].color)),
                  ),
                  5.w.widthBox,
                  Container(
                    height: 2.h,
                    width: 335.w,
                    color: Color(widget.tasks[startMove.indexOf(true)].color),
                  ),
                ],
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
    );
  }
}
