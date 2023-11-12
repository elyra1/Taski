import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart';
import 'package:taski/presentation/widgets/app_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

@RoutePage()
class ExamplePage extends StatelessWidget implements AutoRouteWrapper {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(child: Text('123text', style: AppTextStyles.bold24,),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppTextField(),
          10.h.heightBox,
          AppTextField(
            title: 'Название',
            hintText: 'Введите название задачи',
            obscure: true,
          ),
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Вы нажали на"),
                ),
              );
            },
            child: const Text("EXAMPLE PAGE"),
          ).toCenter(),
          Text("Вы нажали на", style: AppTextStyles.bold18),
          Text("Вы нажали на", style: AppTextStyles.bold20),
          Text("Вы нажали на", style: AppTextStyles.bold24),
          Text("Вы нажали на", style: AppTextStyles.regular18),
          Text("Вы нажали на", style: AppTextStyles.regular20),
          Text("Вы нажали на", style: AppTextStyles.regular24),
          CustomButton(
            height: 40.h,
            width: 130.w,
            onPressed: () {},
            text: 'Сохранить',
          ),
          SvgPicture.asset('assets/icons/edit_icon.svg'),
        ],
      ).toCenter(),
    );
  }

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ExamplePageCubit>(
      create: (context) => getIt<ExamplePageCubit>(),
      child: this,
    );
  }
}
