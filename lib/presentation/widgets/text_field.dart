import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextFieldBar extends StatelessWidget {
  final double? width;
  final double? height;
  final String? title;
  final bool? obscure;
  final TextEditingController? controller;
  final String? hintText;
  const TextFieldBar({
    super.key,
    this.width,
    this.height,
    this.title,
    this.obscure,
    this.controller,
    this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          if (title != null) ...[
            Text(
              title!,
            ),
            5.h.heightBox,
          ],
          SizedBox(
            width: width ?? 345.w,
            height: height ?? 50.h,
            child: TextFormField(
              obscureText: obscure ?? false,
              decoration: InputDecoration(
                hintText: hintText,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
