import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/utils/app_colors.dart';
part 'category.freezed.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String title,
    required String id,
    required String authorId,
    required int color,
    @Default([]) List<Task> tasks,
  }) = _CategoryEntity;

  static Category getEmpty() => Category(
        title: 'Название категории',
        id: '123',
        color: AppColors.blue.value,
        authorId: '34534',
      );
}
