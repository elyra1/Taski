// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:taski/domain/entities/task.dart' as _i11;
import 'package:taski/presentation/pages/create_task/create_task_page.dart'
    as _i1;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i2;
import 'package:taski/presentation/pages/home_page/home_page.dart' as _i3;
import 'package:taski/presentation/pages/send_reset_link/send_reset_link_page.dart'
    as _i4;
import 'package:taski/presentation/pages/sended_reset_link/sended_reset_link_page.dart'
    as _i5;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i6;
import 'package:taski/presentation/pages/sign_up/sign_up_page.dart' as _i7;
import 'package:taski/presentation/pages/tasks_single_day/tasks_single_day_page.dart'
    as _i8;

abstract class $AppRouter extends _i9.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    CreateTaskPage.name: (routeData) {
      final args = routeData.argsAs<CreateTaskPageArgs>(
          orElse: () => const CreateTaskPageArgs());
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(
            child: _i1.CreateTaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    ExamplePage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i2.ExamplePage()),
      );
    },
    HomePage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i3.HomePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i4.SendResetLinkPage()),
      );
    },
    SendedResetLinkPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i5.SendedResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i6.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i7.SignUpPage()),
      );
    },
    TasksSingleDayPage.name: (routeData) {
      return _i9.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i9.WrappedRoute(child: const _i8.TasksSingleDayPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateTaskPage]
class CreateTaskPage extends _i9.PageRouteInfo<CreateTaskPageArgs> {
  CreateTaskPage({
    _i10.Key? key,
    _i11.Task? task,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          CreateTaskPage.name,
          args: CreateTaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTaskPage';

  static const _i9.PageInfo<CreateTaskPageArgs> page =
      _i9.PageInfo<CreateTaskPageArgs>(name);
}

class CreateTaskPageArgs {
  const CreateTaskPageArgs({
    this.key,
    this.task,
  });

  final _i10.Key? key;

  final _i11.Task? task;

  @override
  String toString() {
    return 'CreateTaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i2.ExamplePage]
class ExamplePage extends _i9.PageRouteInfo<void> {
  const ExamplePage({List<_i9.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i9.PageRouteInfo<void> {
  const HomePage({List<_i9.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SendResetLinkPage]
class SendResetLinkPage extends _i9.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i9.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SendedResetLinkPage]
class SendedResetLinkPage extends _i9.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i9.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignInPage]
class SignInPage extends _i9.PageRouteInfo<void> {
  const SignInPage({List<_i9.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignUpPage]
class SignUpPage extends _i9.PageRouteInfo<void> {
  const SignUpPage({List<_i9.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TasksSingleDayPage]
class TasksSingleDayPage extends _i9.PageRouteInfo<void> {
  const TasksSingleDayPage({List<_i9.PageRouteInfo>? children})
      : super(
          TasksSingleDayPage.name,
          initialChildren: children,
        );

  static const String name = 'TasksSingleDayPage';

  static const _i9.PageInfo<void> page = _i9.PageInfo<void>(name);
}
