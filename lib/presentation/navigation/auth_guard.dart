import 'package:auto_route/auto_route.dart';
import 'package:taski/di/locator.dart';
import 'package:taski/domain/repositories/auth_repository.dart';

import 'auto_router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    final authRepository = getIt<AuthRepository>();
    bool isLoggedIn = authRepository.isUserAuthorizedWithEmail;
    if (isLoggedIn) {
      try {
        resolver.next(true);
        return;
      } catch (e) {
        router.push(const SignInPage());
      }
    } else {
      router.push(const SignInPage());
    }
  }
}
