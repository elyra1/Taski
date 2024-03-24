import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';

abstract class Validation {
  static String? validateEmail(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);

    if (email.isEmpty) {
      return 'Email не может быть пустым.';
    }

    if (!regex.hasMatch(email)) {
      return 'Некорректный email.';
    }

    return null;
  }

  static String? validatePassword(String password) {
    String pattern = r'^(?=.*[A-Z])(?=.*\d).{8,}$';
    RegExp regex = RegExp(pattern);

    if (password.isEmpty) {
      return "Пароль не может быть пустым.";
    }

    if (!regex.hasMatch(password)) {
      return 'Пароль содержит как минимум 8 символов, 1 заглавный символ и 1 цифру.';
    }

    return null;
  }

  static String? validateUsername(String username) {
    if (username.length < 5) {
      return 'Имя пользователя должно быть длиннее 5 символов.';
    }

    if (username.contains(RegExp(r'[^a-z0-9]'))) {
      return 'Имя пользователя должно содержать только буквы и цифры.';
    }

    return null;
  }

  static void showAppSnackBar(
      {required String text, required BuildContext context}) {
    Future.delayed(const Duration(milliseconds: 100)).then(
      (value) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15.r))),
          duration: const Duration(seconds: 3),
          content: Text(
            text,
            style: AppTextStyles.semibold12.copyWith(color: AppColors.headblue),
          ),
          backgroundColor: AppColors.pastelgreen,
        ),
      ),
    );
  }
}
