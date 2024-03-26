// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:flutter/material.dart' as _i11;
import 'package:taski/domain/entities/task.dart' as _i12;
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
import 'package:taski/presentation/pages/task_page/task_page.dart' as _i8;
import 'package:taski/presentation/pages/tasks_single_day/tasks_single_day_page.dart'
    as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CreateTaskPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i1.CreateTaskPage()),
      );
    },
    ExamplePage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i2.ExamplePage()),
      );
    },
    HomePage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i3.HomePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i4.SendResetLinkPage()),
      );
    },
    SendedResetLinkPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i5.SendedResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i6.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i7.SignUpPage()),
      );
    },
    TaskPage.name: (routeData) {
      final args = routeData.argsAs<TaskPageArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(
            child: _i8.TaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    TasksSingleDayPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i10.WrappedRoute(child: const _i9.TasksSingleDayPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.CreateTaskPage]
class CreateTaskPage extends _i10.PageRouteInfo<void> {
  const CreateTaskPage({List<_i10.PageRouteInfo>? children})
      : super(
          CreateTaskPage.name,
          initialChildren: children,
        );

  static const String name = 'CreateTaskPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ExamplePage]
class ExamplePage extends _i10.PageRouteInfo<void> {
  const ExamplePage({List<_i10.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i3.HomePage]
class HomePage extends _i10.PageRouteInfo<void> {
  const HomePage({List<_i10.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SendResetLinkPage]
class SendResetLinkPage extends _i10.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i10.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SendedResetLinkPage]
class SendedResetLinkPage extends _i10.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i10.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignInPage]
class SignInPage extends _i10.PageRouteInfo<void> {
  const SignInPage({List<_i10.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignUpPage]
class SignUpPage extends _i10.PageRouteInfo<void> {
  const SignUpPage({List<_i10.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i8.TaskPage]
class TaskPage extends _i10.PageRouteInfo<TaskPageArgs> {
  TaskPage({
    _i11.Key? key,
    required _i12.Task task,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          TaskPage.name,
          args: TaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskPage';

  static const _i10.PageInfo<TaskPageArgs> page =
      _i10.PageInfo<TaskPageArgs>(name);
}

class TaskPageArgs {
  const TaskPageArgs({
    this.key,
    required this.task,
  });

  final _i11.Key? key;

  final _i12.Task task;

  @override
  String toString() {
    return 'TaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i9.TasksSingleDayPage]
class TasksSingleDayPage extends _i10.PageRouteInfo<void> {
  const TasksSingleDayPage({List<_i10.PageRouteInfo>? children})
      : super(
          TasksSingleDayPage.name,
          initialChildren: children,
        );

  static const String name = 'TasksSingleDayPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
