import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class DropdownPicker<T> extends StatelessWidget {
  final Widget icon;
  final String title;
  final void Function(T?) onChanged;
  final List<(String, T)> items;
  final T selectedItem;
  const DropdownPicker({
    Key? key,
    required this.icon,
    required this.title,
    required this.onChanged,
    required this.items,
    required this.selectedItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        10.w.widthBox,
        Text(
          title,
          style: AppTextStyles.semibold16,
        ),
        const Spacer(),
        SizedBox(
          width: 150.w,
          child: DropdownButtonFormField<T>(
            value: selectedItem,
            items: items.map(
              (e) {
                return DropdownMenuItem(
                  value: e.$2,
                  child: Text(
                    e.$1,
                    style: AppTextStyles.semibold12,
                  ),
                );
              },
            ).toList(),
            onChanged: onChanged,
          ),
        ).paddingOnly(right: 30.w),
      ],
    );
  }
}
