import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/di/locator.dart';

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
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            207.h.heightBox,
            SizedBox(
              width: 375.w,
              height: 56.h,
              child: const Text(
                'TASKI',
                style: TextStyle(
                  color: AppColors.headblue,
                  fontSize: 40,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center,
              ).toCenter(),
            ),
            15.w.widthBox,
            25.h.heightBox,
            const AppTextField(
              hintText: '   Email',
            ),
            15.w.widthBox,
            17.h.heightBox,
            const AppTextField(
              hintText: '   Пароль',
            ),
            15.w.widthBox,
            10.h.heightBox,
            SizedBox(
              width: 101,
              height: 16,
              child: InkWell(
                onTap: () {},
                child: Text(
                  'Забыли пароль?',
                  style: TextStyle(
                    color: Color.fromRGBO(52, 161, 176, 1),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.end,
                ),
              ),
            ),
            10.h.heightBox,
            Container(
              alignment: Alignment.topCenter,
              child: SizedBox(
                width: 129.w,
                height: 40.h,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.headblue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Text(
                    'Войти',
                    style: TextStyle(
                        color: Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
            ),
            11.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Нет аккаунта? ',
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1),
                      fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {},
                  child: Text(
                    'Создать',
                    style: TextStyle(
                        color: Color.fromRGBO(52, 161, 176, 1),
                        fontSize: 12,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            )
          ],
        ).toCenter(),
      ),
    );
  }
}
