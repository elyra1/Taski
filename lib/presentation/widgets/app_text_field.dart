import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

class AppTextField extends StatefulWidget {
  final double? width;
  final double? height;
  final String? title;
  final bool obscure;
  final TextEditingController? controller;
  final String? hintText;
  const AppTextField({
    super.key,
    this.width,
    this.height,
    this.title,
    this.obscure = false,
    this.controller,
    this.hintText,
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
              style: AppTextStyles.semibold20,
            ),
            5.h.heightBox,
          ],
          SizedBox(
            width: widget.width ?? 345.w,
            child: TextFormField(
              maxLines: widget.obscure ? 1 : null,
              style: AppTextStyles.semibold14,
              obscureText: widget.obscure ? _obscureText : false,
              decoration: InputDecoration(
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
                    AppTextStyles.semibold14.copyWith(color: AppColors.grey),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  borderSide: BorderSide(width: 1.r, color: AppColors.headblue),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(5.r)),
                  borderSide: BorderSide(width: 2.r, color: AppColors.headblue),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
