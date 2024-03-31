import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_markup.dart';
import 'package:taski/presentation/widgets/task_grids/week_markup.dart/week_task_grid_helper.dart';

class WeekTaskGrid extends StatefulWidget {
  final List<Task> tasks;
  final void Function(DateTime date) onDateChanged;
  final void Function(Task task) onTaskShifted;
  final DateTime selectedWeek;
  final bool isDragAvaliable;

  const WeekTaskGrid({
    Key? key,
    required this.tasks,
    required this.onTaskShifted,
    required this.onDateChanged,
    required this.selectedWeek,
    this.isDragAvaliable = false,
  }) : super(key: key);

  @override
  State<WeekTaskGrid> createState() => _WeekTaskGridState();
}

class _WeekTaskGridState extends State<WeekTaskGrid> {
  List<double> positions = [];
  List<bool> startMove = [];
  double currentDelta = 0;

  @override
  void initState() {
    setState(() {
      positions =
          widget.tasks.map((e) => WeekTaskGridHelper.findHeight(e).$1).toList();
      startMove = widget.tasks.map((e) => false).toList();
    });
    super.initState();
  }

  @override
  void didUpdateWidget(covariant WeekTaskGrid oldWidget) {
    setState(() {
      positions =
          widget.tasks.map((e) => WeekTaskGridHelper.findHeight(e).$1).toList();
      startMove = widget.tasks.map((e) => false).toList();
    });
    super.didUpdateWidget(oldWidget);
  }

  double taskWidth = 45.w;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          WeekMarkup(
            selectedDate: widget.selectedWeek,
          ),
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
            for (int i = 0; i < widget.tasks.length; i++) ...[
              Positioned(
                top: positions[i],
                left: WeekTaskGridHelper.findPaddingLeft(
                  widget.tasks[i],
                ),
                child: GestureDetector(
                  onLongPress: widget.isDragAvaliable
                      ? () => setState(() => startMove[i] = !startMove[i])
                      : null,
                  onVerticalDragUpdate: widget.isDragAvaliable
                      ? startMove[i]
                          ? (details) {
                              if (WeekTaskGridHelper.shouldMove(
                                positions[i],
                                details.delta.dy,
                                widget.tasks[i],
                              )) {
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
                          : null
                      : null,
                  onVerticalDragEnd: widget.isDragAvaliable
                      ? startMove[i]
                          ? (details) {
                              setState(
                                () {
                                  final newTask = widget.tasks[i].copyWith(
                                    startTime: WeekTaskGridHelper.countPeriod(
                                            widget.tasks[i], positions[i])
                                        .$1,
                                    endTime: WeekTaskGridHelper.countPeriod(
                                            widget.tasks[i], positions[i])
                                        .$2,
                                  );
                                  widget.onTaskShifted(newTask);
                                },
                              );
                            }
                          : null
                      : null,
                  child: TaskCard(
                    isWeekView: true,
                    isShifting: startMove[i],
                    task: widget.tasks[i],
                    onTap: () => context.router.push(TaskPage(
                      task: widget.tasks[i],
                    )),
                    height: WeekTaskGridHelper.findHeight(widget.tasks[i]).$2,
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
                    color: Color(widget.tasks[startMove.indexOf(true)].color)),
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
                    color: Color(widget.tasks[startMove.indexOf(true)].color)),
              ),
            ),
          ],
        ],
      ),
    );
  }
}