import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/pages/sended_reset_link/cubit/sended_reset_link_page_cubit.dart';
import 'package:taski/presentation/utils/app_colors.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

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
        elevation: 0,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.h),
          child: Container(
            height: 1.h,
            width: double.maxFinite,
            color: AppColors.headblue,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {},
          color: AppColors.headblue,
        ),
        title: Text(
          'Восстановление',
          style: AppTextStyles.bold18,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 25.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Сообщение отправлено! Проверьте свою электронную почту, мы выслали вам ссылку для сброса пароля.',
              textAlign: TextAlign.start,
              style: AppTextStyles.semibold12,
            ),
            20.h.heightBox,
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
    );
  }
}
