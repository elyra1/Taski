import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/domain/entities/category_entity.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class CategoryCard extends StatelessWidget {
  final CategoryEntity category;

  const CategoryCard({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 12.w,
        vertical: 15.h,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Color(category.color),
      ),
      width: 165.w,
      height: 135.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            category.title,
            style: AppTextStyles.semibold20,
          ),
          5.h.heightBox,
          Text(
            'Количество: ${category.tasks.length}',
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.medium12.copyWith(color: AppColors.headblue),
          ),
          Text(
            'Задач сегодня: 0',
            //To DO
            style: AppTextStyles.medium12.copyWith(color: AppColors.headblue),
          ),
        ],
      ),
    );
  }
}
