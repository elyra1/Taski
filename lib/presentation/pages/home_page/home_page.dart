import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/home_page/cubit/home_page_cubit.dart';
import 'package:taski/presentation/widgets/app_bars/app_bottom_navigation_bar.dart';
import 'package:taski/presentation/widgets/buttons/circle_add_button.dart';

@RoutePage()
class HomePage extends StatefulWidget implements AutoRouteWrapper {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider<HomePageCubit>(
      create: (context) => getIt<HomePageCubit>(),
      child: this,
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        TasksSingleDayPage(),
        ExamplePage(),
        TasksMonthPage(),
      ],
      transitionBuilder: (context, child, animation) => FadeTransition(
        opacity: animation,
        child: child,
      ),
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          floatingActionButton: CircleAddButton(
            onTap: () => context.router.push(CreateTaskPage()),
          ),
          bottomNavigationBar: AppBottomNavigationBar(
            currentIndex: tabsRouter.activeIndex,
            onTap: (index) => tabsRouter.setActiveIndex(index),
          ),
        );
      },
    );
  }
}
