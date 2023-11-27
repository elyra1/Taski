// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i1;
import 'package:taski/presentation/pages/send_reset_link/send_reset_link_page.dart'
    as _i2;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i3;
import 'package:taski/presentation/pages/sign_up/sign_up_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    ExamplePage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i1.ExamplePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i2.SendResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i3.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.WrappedRoute(child: const _i4.SignUpPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.ExamplePage]
class ExamplePage extends _i5.PageRouteInfo<void> {
  const ExamplePage({List<_i5.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SendResetLinkPage]
class SendResetLinkPage extends _i5.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i5.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignInPage]
class SignInPage extends _i5.PageRouteInfo<void> {
  const SignInPage({List<_i5.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignUpPage]
class SignUpPage extends _i5.PageRouteInfo<void> {
  const SignUpPage({List<_i5.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
