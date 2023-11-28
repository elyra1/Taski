import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/send_reset_link/cubit/send_reset_link_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/utils/validation.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

@RoutePage()
class SendResetLinkPage extends StatefulWidget implements AutoRouteWrapper {
  const SendResetLinkPage({Key? key}) : super(key: key);

  @override
  State<SendResetLinkPage> createState() => _SendResetLinkPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SendResetLinkPageCubit>(
      create: (context) => getIt<SendResetLinkPageCubit>(),
      child: this,
    );
  }
}

class _SendResetLinkPageState extends State<SendResetLinkPage> {
  final TextEditingController _emailController = TextEditingController();
  String resetString =
      "Забыли пароль? Пожалуйста, введите свою зарегистрированную электронную почту ниже, и мы отправим вам ссылку для сброса пароля.  Убедитесь, что вводите правильный адрес электронной почты, чтобы получить инструкции по восстановлению пароля. ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Восстановление",
            style: AppTextStyles.bold18,
          ),
          leading: BackButton(
            color: AppColors.headblue,
            onPressed: context.router.pop,
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
          padding: EdgeInsets.all(15.r),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12.r),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AppColors.lightblue,
                ),
                child: Text(
                  resetString,
                  style: AppTextStyles.semibold12,
                ),
              ),
              10.h.heightBox,
              AppTextField(
                width: 345.w,
                height: 50.h,
                hintText: "Email",
                controller: _emailController,
              ),
              25.h.heightBox,
              CustomButton(
                width: 160.w,
                height: 40.h,
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                  List<String> errors = [];
                  if (Validation.validateEmail(_emailController.text) != null) {
                    errors
                        .add(Validation.validateEmail(_emailController.text)!);
                  }
                  if (errors.isEmpty) {
                    final textError = await context
                        .read<SendResetLinkPageCubit>()
                        .sendResetLink(email: _emailController.text);
                    if (textError != null) {
                      errors.add(textError);
                    } else {
                      if (context.mounted) {
                        context.router.push(const SendedResetLinkPage());
                      }
                    }
                  }
                  if (errors.isNotEmpty && context.mounted) {
                    Validation.showAppSnackBar(
                      context: context,
                      text: errors.first,
                    );
                  }
                },
                text: "Отправить",
              ),
            ],
          ),
        ));
  }
}
