import 'package:auto_route/auto_route.dart';
import 'package:taski/presentation/navigation/auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SendedResetLinkPage.page,
          initial: true,
        ),
      ];
}
