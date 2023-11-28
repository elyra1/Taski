import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class AppBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  final void Function(int) onTap;
  const AppBottomNavigationBar({
    Key? key,
    required this.currentIndex,
    required this.onTap,
  }) : super(key: key);

  @override
  State<AppBottomNavigationBar> createState() => _AppBottomNavigationBarState();
}

class _AppBottomNavigationBarState extends State<AppBottomNavigationBar> {
  final List<String> items = ["День", "Неделя", "Месяц"];
  late int selectedItem = widget.currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            offset: Offset(0, -1.r),
            blurRadius: 1.r,
            color: AppColors.headblue.withOpacity(0.5),
          ),
        ],
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(15.r),
        ),
        color: Colors.white,
      ),
      width: double.maxFinite,
      height: 100.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (int i = 0; i < items.length; i++) ...[
            Material(
              color: selectedItem == i ? AppColors.lightblue : Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              child: InkWell(
                borderRadius: BorderRadius.circular(15.r),
                onTap: () {
                  setState(() => selectedItem = i);
                  widget.onTap(selectedItem);
                },
                child: SizedBox(
                  width: 80.w,
                  height: 50.h,
                  child: Text(
                    items[i],
                    style: AppTextStyles.semibold14
                        .copyWith(color: AppColors.headblue),
                  ).toCenter(),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
