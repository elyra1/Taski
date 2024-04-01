import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';

abstract class WeekTaskGridHelper {
  ///Возвращает высоту карточки задачи и отступ от края

  static List<String> getDays() => ["Пн", "Вт", "Ср", "Чт", "Пт", "Сб", "Вс"];

  static List<DateTime> getWeekDates(DateTime date) {
    DateTime monday = date.subtract(Duration(days: date.weekday - 1));
    List<DateTime> weekDates = [];
    for (int i = 0; i < 7; i++) {
      weekDates.add(monday.add(Duration(days: i)));
    }

    return weekDates;
  }

  static double findPaddingLeft(Task task) {
    return 17.w + task.startTime.toDate().weekday * 45.w;
  }

  ///Возвращает высоту карточки задачи и отступ от края
  static (double, double) findHeight(Task task) {
    final diff = task.endTime.toDate().difference(task.startTime.toDate());
    final height = (diff.inMinutes / 60) * 100.h;
    final top = task.startTime.toDate().hour * (100.h) +
        (task.startTime.toDate().minute / 60) * (100.h);
    return (top, height);
  }

  ///Возвращает startTime и endTime по позиции на скролле
  static (Timestamp, Timestamp) countPeriod(Task task, double position) {
    final cardHeight = findHeight(task).$2;
    final endTimePos = position + cardHeight;
    final startTime = Timestamp.fromDate(
      task.startTime.toDate().copyWith(
            hour: position ~/ 100.h,
            minute: ((position - (position ~/ 100.h) * 100.h) / (100.h / 60))
                .round(),
          ),
    );
    final endTime = Timestamp.fromDate(
      task.startTime.toDate().copyWith(
            hour: endTimePos ~/ 100.h,
            minute:
                ((endTimePos - (endTimePos ~/ 100.h) * 100.h) / (100.h / 60))
                    .round(),
          ),
    );
    return (startTime, endTime);
  }

  static bool shouldMove(double position, double dyDelta, Task task) {
    bool isTopLimit = position >= 53.5.h || dyDelta > 0;
    bool isBottomLimit = position + findHeight(task).$2 < 100.h * 24;
    bool isDragNegativeDirection = dyDelta < 0;
    return (isTopLimit) && (isBottomLimit || isDragNegativeDirection);
  }

  static (String, String) getTimeHHMM(Task task, double position) {
    final startTime =
        WeekTaskGridHelper.countPeriod(task, position).$1.toDate();
    final endTime = WeekTaskGridHelper.countPeriod(task, position).$2.toDate();
    return (
      "${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}",
      "${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}"
    );
  }
}
