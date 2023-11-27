import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';

class ColorPickItem extends StatelessWidget {
  final Color color;
  final VoidCallback onTap;
  final bool isSelected;
  const ColorPickItem({
    super.key,
    required this.color,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSelected ? 45.r : 40.r,
        height: isSelected ? 45.r : 40.r,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(
            color: AppColors.headblue,
            width: 1.w,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    offset: Offset(0, 1.r),
                    color: AppColors.headblue,
                    blurRadius: 4.r,
                  ),
                ]
              : null,
        ),
      ),
    );
  }
}
