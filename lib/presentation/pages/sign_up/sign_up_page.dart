import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/pages/sign_up/cubit/sign_up_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

@RoutePage()
class SignUpPage extends StatefulWidget implements AutoRouteWrapper {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignUpPageCubit>(
      create: (context) => getIt<SignUpPageCubit>(),
      child: this,
    );
  }
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confrimPasswordController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Регистрация",
          style: AppTextStyles.bold18,
        ),
        leading: BackButton(
          color: AppColors.headblue,
          onPressed: () {},
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            color: AppColors.headblue,
            width: double.maxFinite,
            height: 1.h,
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            25.h.heightBox,
            AppTextField(
              controller: _usernameController,
              hintText: "Имя пользователя",
            ),
            25.h.heightBox,
            AppTextField(
              controller: _emailController,
              hintText: "Email",
            ),
            25.h.heightBox,
            AppTextField(
              controller: _passwordController,
              hintText: "Пароль",
              obscure: true,
            ),
            25.h.heightBox,
            AppTextField(
              controller: _confrimPasswordController,
              hintText: "Подтверждение пароля",
              obscure: true,
            ),
            25.h.heightBox,
            CustomButton(
              width: 175.w,
              height: 40.h,
              onPressed: () {
                log("NAME:" +
                    _usernameController.text +
                    "EMAIL" +
                    _emailController.text +
                    "Password" +
                    _passwordController.text);
              },
              text: "Зарегистрироваться",
            ),
          ],
        ),
      ),
    );
  }
}
