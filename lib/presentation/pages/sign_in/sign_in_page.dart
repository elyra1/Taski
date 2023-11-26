import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';

@RoutePage()
class SignInPage extends StatefulWidget implements AutoRouteWrapper {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SignInPageCubit>(
      create: (context) => getIt<SignInPageCubit>(),
      child: this,
    );
  }
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(),
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          children: [
            SizedBox(
              height: 207.h,
            ),
            SizedBox(
              width: 128.w,
              height: 49.h,
              child: const Column(
                children: [
                  Text(
                    'TASKI',
                    style: TextStyle(
                      color: AppColors.headblue,
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 15.w,
              height: 25.h,
            ),
            AppTextField(
              hintText: 'Email',
            ),
            SizedBox(
              width: 15.w,
              height: 17.h,
            ),
            AppTextField(
              hintText: 'Пароль',
            ),
            SizedBox(
              width: 15.w,
              height: 10.h,
            ),
            SizedBox(
              width: 101.w,
              height: 16.h,
              child: TextButton(
                onPressed: () {},
                child: const Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 161, 176, 1),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            SizedBox(
              width: 129.w,
              height: 40.h,
              child: TextButton(
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.headblue)),
                onPressed: () {},
                child: const Text(
                  'Войти',
                  style: TextStyle(
                      color: Color.fromRGBO(255, 255, 255, 1), fontSize: 16),
                ),
              ),
            )
          ],
        ).toCenter(),
      ),
    );
  }
}
