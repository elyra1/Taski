import 'package:auto_route/auto_route.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SignInPage.page,
          initial: true,
        ),
      ];
}
