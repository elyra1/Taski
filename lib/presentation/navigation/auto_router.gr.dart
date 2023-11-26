// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i1;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    ExamplePage.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: const _i1.ExamplePage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: const _i2.SignInPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.ExamplePage]
class ExamplePage extends _i3.PageRouteInfo<void> {
  const ExamplePage({List<_i3.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignInPage]
class SignInPage extends _i3.PageRouteInfo<void> {
  const SignInPage({List<_i3.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
