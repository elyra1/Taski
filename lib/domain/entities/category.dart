import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taski/presentation/utils/app_colors.dart';
part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    required String title,
    required String id,
    required String authorId,
    required int color,
    @Default([]) List<String> tasks,
  }) = _CategoryEntity;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  static Category getEmpty() => Category(
        title: 'Категория',
        id: '',
        color: AppColors.blue.value,
        authorId: '',
      );
}
