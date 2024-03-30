import 'package:auto_route/auto_route.dart';
import 'package:taski/presentation/navigation/auth_guard.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomePage.page,
          guards: [AuthGuard()],
          children: [
            AutoRoute(
              page: TasksSingleDayPage.page,
            ),
            AutoRoute(
              page: ExamplePage.page,
            ),
          ],
        ),
        AutoRoute(
          page: SignInPage.page,
        ),
        AutoRoute(
          page: SignUpPage.page,
        ),
        AutoRoute(
          page: SendResetLinkPage.page,
        ),
        AutoRoute(
          page: SendedResetLinkPage.page,
        ),
        AutoRoute(
          page: CreateTaskPage.page,
        ),
        AutoRoute(
          page: TaskPage.page,
        ),
        AutoRoute(
          page: FriendsPage.page,
        ),
        AutoRoute(
          page: CategoriesPage.page,
        ),
      ];
}
