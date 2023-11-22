import 'package:auto_route/auto_route.dart';
import 'package:awesome_extensions/awesome_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task_entity.dart';
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart';
import 'package:taski/presentation/utils/app_text_styles.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';
import 'package:taski/presentation/widgets/buttons/task_card.dart';

@RoutePage()
class ExamplePage extends StatelessWidget implements AutoRouteWrapper {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TaskCard(
            onTap: () {},
            width: 300.w,
            height: 135.h,
            task: TaskEntity.getEmpty().copyWith(
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquet sit amet massa eget ultricies. Vestibulum vel leo ac purus ultricies facilisis.',
            ),
          ),
          TaskCard(
            onTap: () {},
            width: 150.w,
            height: 50.h,
            task: TaskEntity.getEmpty().copyWith(
              title: "ADASDASDASDASDASDASDASDASDASDASDD",
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquet sit amet massa eget ultricies. Vestibulum vel leo ac purus ultricies facilisis.',
            ),
          ),
          TaskCard(
            onTap: () {},
            width: 200.w,
            height: 100.h,
            task: TaskEntity.getEmpty().copyWith(
              description:
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla aliquet sit amet massa eget ultricies. Vestibulum vel leo ac purus ultricies facilisis.',
            ),
          ),
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
