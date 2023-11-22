import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taski/presentation/utils/app_colors.dart';
part 'task_entity.freezed.dart';

@freezed
class TaskEntity with _$TaskEntity {
  const factory TaskEntity({
    required String title,
    @Default('') String? description,
    required String id,
    required String authorId,
    required Timestamp startTime,
    required Timestamp endTime,
    required int color,
    @Default('') String? category,
  }) = _TaskEntity;

  static TaskEntity getEmpty() => TaskEntity(
      title: 'Название задачи',
      id: '123',
      authorId: '4234234',
      description: 'Сделать TaskCard',
      startTime: Timestamp.fromDate(DateTime.now()),
      endTime: Timestamp.fromDate(DateTime.now()),
      color: AppColors.blue.value,
      category: 'Category');
}
