import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  final double width;
  final double height;
  final Color color;
  final void Function() onPressed;
  final String text;

  const CustomButton({
    Key? key,
    required this.width,
    required this.height,
    this.color = AppColors.headblue,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.r),
          ),
        ),
        child: Text(
          text,
          style: AppTextStyles.medium12,
        ),
      ),
    );
  }
}
