import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/task.dart';

abstract class SingleDayTaskGridHelper {
  ///Возвращает высоту карточки задачи и отступ от края
  static (double, double) findHeight(Task task) {
    final diff = task.endTime.toDate().difference(task.startTime.toDate());
    final height = (diff.inMinutes / 60) * 100.h;
    final top = task.startTime.toDate().hour * (100.h) +
        (task.startTime.toDate().minute / 60) * (100.h);
    return (top + 50.h, height);
  }

  ///Возвращает startTime и endTime по позиции на скролле
  static (Timestamp, Timestamp) countPeriod(Task task, double position) {
    final cardHeight = findHeight(task).$2;
    final endTimePos = position + cardHeight;
    Timestamp startTime = Timestamp.fromDate(
      task.startTime.toDate().copyWith(
            hour: position ~/ 100.h,
            minute: ((-50.h + position - (position ~/ 100.h) * 100.h) /
                    (100.h / 60))
                .round(),
          ),
    );
    Timestamp endTime = Timestamp.fromDate(
      task.startTime.toDate().copyWith(
            hour: endTimePos ~/ 100.h,
            minute: ((endTimePos - 50.h - (endTimePos ~/ 100.h) * 100.h) /
                    (100.h / 60))
                .round(),
          ),
    );
    if (position < 53.5.h && startTime.toDate().hour > 1) {
      startTime = Timestamp.fromDate(
          task.startTime.toDate().copyWith(hour: 0, minute: 0));
      endTime = Timestamp.fromDate(startTime
          .toDate()
          .add(task.endTime.toDate().difference(task.startTime.toDate())));
    }

    if (position > 100.h * 24 && endTime.toDate().hour < 1) {
      endTime = Timestamp.fromDate(
          task.endTime.toDate().copyWith(hour: 23, minute: 59));
      startTime = Timestamp.fromDate(endTime
          .toDate()
          .subtract(task.endTime.toDate().difference(task.startTime.toDate())));
    }

    return (startTime, endTime);
  }

  static bool shouldMove(double position, double dyDelta, Task task) {
    bool isTopLimit = position >= 55.h || dyDelta > 0;
    bool isBottomLimit = position + findHeight(task).$2 < 100.h * 24 + 25.h;
    bool isDragNegativeDirection = dyDelta < 0;
    return (isTopLimit) && (isBottomLimit || isDragNegativeDirection);
  }

  static (String, String) getTimeHHMM(Task task, double position) {
    final startTime =
        SingleDayTaskGridHelper.countPeriod(task, position).$1.toDate();
    final endTime =
        SingleDayTaskGridHelper.countPeriod(task, position).$2.toDate();
    return (
      "${startTime.hour}:${startTime.minute.toString().padLeft(2, '0')}",
      "${endTime.hour}:${endTime.minute.toString().padLeft(2, '0')}"
    );
  }
}
