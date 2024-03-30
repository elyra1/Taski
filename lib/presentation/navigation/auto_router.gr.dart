// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/material.dart' as _i13;
import 'package:taski/domain/entities/task.dart' as _i14;
import 'package:taski/presentation/pages/categories_page/categories_page.dart'
    as _i1;
import 'package:taski/presentation/pages/create_task/create_task_page.dart'
    as _i2;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i3;
import 'package:taski/presentation/pages/friends_page/friends_page.dart' as _i4;
import 'package:taski/presentation/pages/home_page/home_page.dart' as _i5;
import 'package:taski/presentation/pages/send_reset_link/send_reset_link_page.dart'
    as _i6;
import 'package:taski/presentation/pages/sended_reset_link/sended_reset_link_page.dart'
    as _i7;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i8;
import 'package:taski/presentation/pages/sign_up/sign_up_page.dart' as _i9;
import 'package:taski/presentation/pages/task_page/task_page.dart' as _i10;
import 'package:taski/presentation/pages/tasks_single_day/tasks_single_day_page.dart'
    as _i11;

abstract class $AppRouter extends _i12.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    CategoriesPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i1.CategoriesPage()),
      );
    },
    CreateTaskPage.name: (routeData) {
      final args = routeData.argsAs<CreateTaskPageArgs>(
          orElse: () => const CreateTaskPageArgs());
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i2.CreateTaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    ExamplePage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i3.ExamplePage()),
      );
    },
    FriendsPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i4.FriendsPage()),
      );
    },
    HomePage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i5.HomePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i6.SendResetLinkPage()),
      );
    },
    SendedResetLinkPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i7.SendedResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i8.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i9.SignUpPage()),
      );
    },
    TaskPage.name: (routeData) {
      final args = routeData.argsAs<TaskPageArgs>();
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(
            child: _i10.TaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    TasksSingleDayPage.name: (routeData) {
      return _i12.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.WrappedRoute(child: const _i11.TasksSingleDayPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesPage extends _i12.PageRouteInfo<void> {
  const CategoriesPage({List<_i12.PageRouteInfo>? children})
      : super(
          CategoriesPage.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CreateTaskPage]
class CreateTaskPage extends _i12.PageRouteInfo<CreateTaskPageArgs> {
  CreateTaskPage({
    _i13.Key? key,
    _i14.Task? task,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          CreateTaskPage.name,
          args: CreateTaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTaskPage';

  static const _i12.PageInfo<CreateTaskPageArgs> page =
      _i12.PageInfo<CreateTaskPageArgs>(name);
}

class CreateTaskPageArgs {
  const CreateTaskPageArgs({
    this.key,
    this.task,
  });

  final _i13.Key? key;

  final _i14.Task? task;

  @override
  String toString() {
    return 'CreateTaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i3.ExamplePage]
class ExamplePage extends _i12.PageRouteInfo<void> {
  const ExamplePage({List<_i12.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i4.FriendsPage]
class FriendsPage extends _i12.PageRouteInfo<void> {
  const FriendsPage({List<_i12.PageRouteInfo>? children})
      : super(
          FriendsPage.name,
          initialChildren: children,
        );

  static const String name = 'FriendsPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i5.HomePage]
class HomePage extends _i12.PageRouteInfo<void> {
  const HomePage({List<_i12.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SendResetLinkPage]
class SendResetLinkPage extends _i12.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i12.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SendedResetLinkPage]
class SendedResetLinkPage extends _i12.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i12.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SignInPage]
class SignInPage extends _i12.PageRouteInfo<void> {
  const SignInPage({List<_i12.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignUpPage]
class SignUpPage extends _i12.PageRouteInfo<void> {
  const SignUpPage({List<_i12.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TaskPage]
class TaskPage extends _i12.PageRouteInfo<TaskPageArgs> {
  TaskPage({
    _i13.Key? key,
    required _i14.Task task,
    List<_i12.PageRouteInfo>? children,
  }) : super(
          TaskPage.name,
          args: TaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskPage';

  static const _i12.PageInfo<TaskPageArgs> page =
      _i12.PageInfo<TaskPageArgs>(name);
}

class TaskPageArgs {
  const TaskPageArgs({
    this.key,
    required this.task,
  });

  final _i13.Key? key;

  final _i14.Task task;

  @override
  String toString() {
    return 'TaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i11.TasksSingleDayPage]
class TasksSingleDayPage extends _i12.PageRouteInfo<void> {
  const TasksSingleDayPage({List<_i12.PageRouteInfo>? children})
      : super(
          TasksSingleDayPage.name,
          initialChildren: children,
        );

  static const String name = 'TasksSingleDayPage';

  static const _i12.PageInfo<void> page = _i12.PageInfo<void>(name);
}
