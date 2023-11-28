import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/validation.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

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
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SignInPageCubit>();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            207.h.heightBox,
            Text(
              'TASKI',
              style: AppTextStyles.bold40,
            ).toCenter(),
            25.h.heightBox,
            AppTextField(
              hintText: 'Email',
              controller: emailController,
              textInputAction: TextInputAction.next,
            ),
            20.h.heightBox,
            AppTextField(
              hintText: 'Пароль',
              obscure: true,
              controller: passwordController,
            ),
            10.h.heightBox,
            InkWell(
              onTap: () => context.router.push(const SendResetLinkPage()),
              child: Text(
                'Забыли пароль?',
                style:
                    AppTextStyles.medium12.copyWith(color: AppColors.iconblue),
              ),
            ),
            10.h.heightBox,
            CustomButton(
              width: 130.w,
              height: 40.h,
              onPressed: () async {
                // to do validation
                FocusScope.of(context).unfocus();
                List<String> errors = [];
                if (Validation.validateEmail(emailController.text) != null) {
                  errors.add(Validation.validateEmail(emailController.text)!);
                }
                if (Validation.validatePassword(passwordController.text) !=
                    null) {
                  errors.add(
                      Validation.validatePassword(passwordController.text)!);
                }
                if (errors.isEmpty) {
                  final isLogined = await cubit.signIn(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  if (isLogined == null && context.mounted) {
                    context.router.push(const TasksSingleDayPage());
                  }
                  if (isLogined != null) {
                    errors.add(isLogined);
                  }
                }
                if (errors.isNotEmpty && context.mounted) {
                  Validation.showAppSnackBar(
                    context: context,
                    text: errors.first,
                  );
                }
              },
              text: "Войти",
            ).toCenter(),
            15.h.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Нет аккаунта? ',
                  style: AppTextStyles.medium12
                      .copyWith(color: AppColors.headblue),
                ),
                InkWell(
                  onTap: () => context.router.push(const SignUpPage()),
                  child: Text(
                    'Создать',
                    style: AppTextStyles.medium12
                        .copyWith(color: AppColors.iconblue),
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
