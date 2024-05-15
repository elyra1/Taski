import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final String? title;
  final TextStyle? titleTextStyle;
  final bool obscure;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction? textInputAction;
  final void Function(String)? onChanged;
  final InputBorder? enabledBorder;
  final InputBorder? focusedBorder;
  const AppTextField({
    super.key,
    this.width,
    this.height,
    this.title,
    this.obscure = false,
    this.controller,
    this.hintText,
    this.textInputAction,
    this.onChanged,
    this.enabledBorder,
    this.focusedBorder,
    this.titleTextStyle,
  });

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.title != null) ...[
            Text(
              widget.title!,
              style: widget.titleTextStyle ?? AppTextStyles.semibold18,
            ),
            5.h.heightBox,
          ],
          SizedBox(
            width: widget.width ?? 345.w,
            height: widget.height,
            child: TextFormField(
              controller: widget.controller,
              textInputAction: widget.textInputAction ?? TextInputAction.done,
              maxLines: widget.obscure ? 1 : null,
              style: AppTextStyles.semibold12,
              obscureText: widget.obscure ? _obscureText : false,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: widget.obscure
                    ? IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: AppColors.headblue,
                        ),
                        onPressed: () =>
                            setState(() => _obscureText = !_obscureText),
                      )
                    : null,
                hintText: widget.hintText,
                hintStyle:
                    AppTextStyles.semibold12.copyWith(color: AppColors.grey),
                enabledBorder: widget.enabledBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      borderSide:
                          BorderSide(width: 1.r, color: AppColors.headblue),
                    ),
                focusedBorder: widget.focusedBorder ??
                    OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.r)),
                      borderSide:
                          BorderSide(width: 2.r, color: AppColors.headblue),
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
