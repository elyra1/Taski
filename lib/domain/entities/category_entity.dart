import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taski/domain/entities/task_entity.dart';
import 'package:taski/presentation/utils/app_colors.dart';
part 'category_entity.freezed.dart';

@freezed
class CategoryEntity with _$CategoryEntity {
  const factory CategoryEntity({
    required String title,
    required String id,
    required String authorId,
    required int color,
    @Default([]) List<TaskEntity> tasks,
  }) = _CategoryEntity;

  static CategoryEntity getEmpty() => CategoryEntity(
        title: 'Название категории',
        id: '123',
        color: AppColors.blue.value,
        authorId: '34534',
      );
}
