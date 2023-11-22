import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taski/domain/entities/converter/timestamp_converter.dart';
import 'package:taski/presentation/utils/app_colors.dart';
part 'task_entity.freezed.dart';
part 'task_entity.g.dart';

@freezed
class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String title,
    @Default('') String? description,
    required String id,
    required String authorId,
    @TimestampConverter() required Timestamp startTime,
    @TimestampConverter() required Timestamp endTime,
    required int color,
  }) = _TaskEntity;

  factory TaskEntity.fromJson(Map<String, dynamic> json) =>
      _$TaskEntityFromJson(json);

  static TaskEntity getEmpty() => TaskEntity(
        title: 'Название задачи',
        id: '123',
        authorId: '4234234',
        startTime: Timestamp.fromDate(DateTime.now()),
        endTime: Timestamp.fromDate(DateTime.now()),
        color: AppColors.blue.value,
      );
}
