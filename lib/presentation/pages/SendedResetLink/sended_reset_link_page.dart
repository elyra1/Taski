import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/pages/SendedResetLink/cubit/sended_reset_link_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';

@RoutePage()
class SendedResetLinkPage extends StatefulWidget implements AutoRouteWrapper {
  const SendedResetLinkPage({Key? key}) : super(key: key);

  @override
  State<SendedResetLinkPage> createState() => _SendedResetLinkPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<SendedResetLinkPageCubit>(
      create: (context) => getIt<SendedResetLinkPageCubit>(),
      child: this,
    );
  }
}

class _SendedResetLinkPageState extends State<SendedResetLinkPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {},
          color: AppColors.headblue,
        ),
        title: Text('Восстановление',
          style: AppTextStyles.bold18,
        ),
      ),
      body: Center(
        child: Container(
          width: 375.w,
          height: 812.h,
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0)
              ),
              Text(
                'Сообщение отправлено! Проверьте свою электронную почту, мы выслали вам ссылку для сброса пароля.',
                textAlign: TextAlign.start,
                style: AppTextStyles.semibold12,
              ),
              SizedBox(height: 20),
              CustomButton(
                width: 160.w,
                height: 40.h,
                color: AppColors.headblue,
                onPressed: () {},
                text: 'Войти',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
