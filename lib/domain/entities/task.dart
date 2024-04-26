import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taski/domain/entities/converter/timestamp_converter.dart';
import 'package:taski/presentation/utils/app_colors.dart';
part 'task.freezed.dart';
part 'task.g.dart';

@freezed
class Task with _$Task {
  const factory Task({
    required String title,
    @Default('') String? description,
    required String id,
    required String authorId,
    @TimestampConverter() required Timestamp startTime,
    @TimestampConverter() required Timestamp endTime,
    required int color,
    @Default(null) String? category,
    @Default(false) bool notificationSended,
    @Default(900) int remindTimeInSeconds,
    @Default([]) List<String> contributors,
  }) = _TaskEntity;

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  static Task getEmpty() => Task(
        title: 'Название задачи',
        id: '123',
        authorId: '4234234',
        description: 'Сделать TaskCard',
        startTime: Timestamp.fromDate(DateTime.now()),
        endTime: Timestamp.fromDate(DateTime.now()),
        color: AppColors.blue.value,
        category: 'Category',
      );
}
