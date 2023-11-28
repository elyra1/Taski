import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/entities/task.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart';
import 'package:taski/presentation/widgets/app_bars/main_app_bar.dart';
import 'package:taski/presentation/widgets/buttons/custom_button.dart';

@RoutePage()
class ExamplePage extends StatefulWidget implements AutoRouteWrapper {
  const ExamplePage({Key? key}) : super(key: key);

  @override
  State<ExamplePage> createState() => _ExamplePageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<ExamplePageCubit>(
      create: (context) => getIt<ExamplePageCubit>(),
      child: this,
    );
  }
}

class _ExamplePageState extends State<ExamplePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        child: CustomButton(
          height: 40.h,
          width: 200.w,
          text: "Выйти",
          onPressed: () async {
            context.read<ExamplePageCubit>().signOut().then((value) {
              context.router.popUntilRoot();
              context.router.replace(const SignInPage());
            });
          },
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox(),
    );
  }
}
