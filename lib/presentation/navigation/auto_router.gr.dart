// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:taski/presentation/pages/create_task/create_task_page.dart'
    as _i1;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i2;
import 'package:taski/presentation/pages/send_reset_link/send_reset_link_page.dart'
    as _i3;
import 'package:taski/presentation/pages/sended_reset_link/sended_reset_link_page.dart'
    as _i4;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i5;
import 'package:taski/presentation/pages/sign_up/sign_up_page.dart' as _i6;
import 'package:taski/presentation/pages/tasks_single_day/tasks_single_day_page.dart'
    as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    CreateTaskPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WrappedRoute(child: const _i1.CreateTaskPage()),
      );
    },
    ExamplePage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WrappedRoute(child: const _i2.ExamplePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WrappedRoute(child: const _i3.SendResetLinkPage()),
      );
    },
    SendedResetLinkPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WrappedRoute(child: const _i4.SendedResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WrappedRoute(child: const _i5.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WrappedRoute(child: const _i6.SignUpPage()),
      );
    },
    TasksSingleDayPage.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.WrappedRoute(child: const _i7.TasksSingleDayPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateTaskPage]
class CreateTaskPage extends _i8.PageRouteInfo<void> {
  const CreateTaskPage({List<_i8.PageRouteInfo>? children})
      : super(
          CreateTaskPage.name,
          initialChildren: children,
        );

  static const String name = 'CreateTaskPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExamplePage]
class ExamplePage extends _i8.PageRouteInfo<void> {
  const ExamplePage({List<_i8.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SendResetLinkPage]
class SendResetLinkPage extends _i8.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i8.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SendedResetLinkPage]
class SendedResetLinkPage extends _i8.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i8.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignInPage]
class SignInPage extends _i8.PageRouteInfo<void> {
  const SignInPage({List<_i8.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignUpPage]
class SignUpPage extends _i8.PageRouteInfo<void> {
  const SignUpPage({List<_i8.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.TasksSingleDayPage]
class TasksSingleDayPage extends _i8.PageRouteInfo<void> {
  const TasksSingleDayPage({List<_i8.PageRouteInfo>? children})
      : super(
          TasksSingleDayPage.name,
          initialChildren: children,
        );

  static const String name = 'TasksSingleDayPage';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
