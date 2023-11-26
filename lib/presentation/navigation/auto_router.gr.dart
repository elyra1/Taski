// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i1;
import 'package:taski/presentation/pages/SendedResetLink/sended_reset_link_page.dart'
    as _i2;

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
    SendedResetLinkPage.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.WrappedRoute(child: const _i2.SendedResetLinkPage()),
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
/// [_i2.SendedResetLinkPage]
class SendedResetLinkPage extends _i3.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i3.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}
