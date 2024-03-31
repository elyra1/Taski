// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i15;
import 'package:flutter/material.dart' as _i16;
import 'package:taski/domain/entities/category.dart' as _i17;
import 'package:taski/domain/entities/task.dart' as _i18;
import 'package:taski/presentation/pages/categories_page/categories_page.dart'
    as _i1;
import 'package:taski/presentation/pages/category_page/category_page.dart'
    as _i2;
import 'package:taski/presentation/pages/create_task/create_task_page.dart'
    as _i3;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i4;
import 'package:taski/presentation/pages/friends_page/friends_page.dart' as _i5;
import 'package:taski/presentation/pages/home_page/home_page.dart' as _i6;
import 'package:taski/presentation/pages/send_reset_link/send_reset_link_page.dart'
    as _i7;
import 'package:taski/presentation/pages/sended_reset_link/sended_reset_link_page.dart'
    as _i8;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i9;
import 'package:taski/presentation/pages/sign_up/sign_up_page.dart' as _i10;
import 'package:taski/presentation/pages/task_page/task_page.dart' as _i11;
import 'package:taski/presentation/pages/tasks_month/tasks_month_page.dart'
    as _i12;
import 'package:taski/presentation/pages/tasks_single_day/tasks_single_day_page.dart'
    as _i13;
import 'package:taski/presentation/pages/user_search_page/user_search_page.dart'
    as _i14;

abstract class $AppRouter extends _i15.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i15.PageFactory> pagesMap = {
    CategoriesPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i1.CategoriesPage()),
      );
    },
    CategoryPage.name: (routeData) {
      final args = routeData.argsAs<CategoryPageArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i2.CategoryPage(
          key: args.key,
          category: args.category,
        )),
      );
    },
    CreateTaskPage.name: (routeData) {
      final args = routeData.argsAs<CreateTaskPageArgs>(
          orElse: () => const CreateTaskPageArgs());
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(
            child: _i3.CreateTaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    ExamplePage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i4.ExamplePage()),
      );
    },
    FriendsPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i5.FriendsPage()),
      );
    },
    HomePage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i6.HomePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i7.SendResetLinkPage()),
      );
    },
    SendedResetLinkPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i8.SendedResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i9.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i10.SignUpPage()),
      );
    },
    TaskPage.name: (routeData) {
      final args = routeData.argsAs<TaskPageArgs>();
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i11.TaskPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
    TasksMonthPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i12.TasksMonthPage()),
      );
    },
    TasksSingleDayPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i13.TasksSingleDayPage()),
      );
    },
    UserSearchPage.name: (routeData) {
      return _i15.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i15.WrappedRoute(child: const _i14.UserSearchPage()),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesPage extends _i15.PageRouteInfo<void> {
  const CategoriesPage({List<_i15.PageRouteInfo>? children})
      : super(
          CategoriesPage.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryPage]
class CategoryPage extends _i15.PageRouteInfo<CategoryPageArgs> {
  CategoryPage({
    _i16.Key? key,
    required _i17.Category category,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CategoryPage.name,
          args: CategoryPageArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryPage';

  static const _i15.PageInfo<CategoryPageArgs> page =
      _i15.PageInfo<CategoryPageArgs>(name);
}

class CategoryPageArgs {
  const CategoryPageArgs({
    this.key,
    required this.category,
  });

  final _i16.Key? key;

  final _i17.Category category;

  @override
  String toString() {
    return 'CategoryPageArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i3.CreateTaskPage]
class CreateTaskPage extends _i15.PageRouteInfo<CreateTaskPageArgs> {
  CreateTaskPage({
    _i16.Key? key,
    _i18.Task? task,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          CreateTaskPage.name,
          args: CreateTaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTaskPage';

  static const _i15.PageInfo<CreateTaskPageArgs> page =
      _i15.PageInfo<CreateTaskPageArgs>(name);
}

class CreateTaskPageArgs {
  const CreateTaskPageArgs({
    this.key,
    this.task,
  });

  final _i16.Key? key;

  final _i18.Task? task;

  @override
  String toString() {
    return 'CreateTaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i4.ExamplePage]
class ExamplePage extends _i15.PageRouteInfo<void> {
  const ExamplePage({List<_i15.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FriendsPage]
class FriendsPage extends _i15.PageRouteInfo<void> {
  const FriendsPage({List<_i15.PageRouteInfo>? children})
      : super(
          FriendsPage.name,
          initialChildren: children,
        );

  static const String name = 'FriendsPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomePage extends _i15.PageRouteInfo<void> {
  const HomePage({List<_i15.PageRouteInfo>? children})
      : super(
          HomePage.name,
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SendResetLinkPage]
class SendResetLinkPage extends _i15.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i15.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SendedResetLinkPage]
class SendedResetLinkPage extends _i15.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i15.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SignInPage]
class SignInPage extends _i15.PageRouteInfo<void> {
  const SignInPage({List<_i15.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignUpPage]
class SignUpPage extends _i15.PageRouteInfo<void> {
  const SignUpPage({List<_i15.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i11.TaskPage]
class TaskPage extends _i15.PageRouteInfo<TaskPageArgs> {
  TaskPage({
    _i16.Key? key,
    required _i18.Task task,
    List<_i15.PageRouteInfo>? children,
  }) : super(
          TaskPage.name,
          args: TaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskPage';

  static const _i15.PageInfo<TaskPageArgs> page =
      _i15.PageInfo<TaskPageArgs>(name);
}

class TaskPageArgs {
  const TaskPageArgs({
    this.key,
    required this.task,
  });

  final _i16.Key? key;

  final _i18.Task task;

  @override
  String toString() {
    return 'TaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i12.TasksMonthPage]
class TasksMonthPage extends _i15.PageRouteInfo<void> {
  const TasksMonthPage({List<_i15.PageRouteInfo>? children})
      : super(
          TasksMonthPage.name,
          initialChildren: children,
        );

  static const String name = 'TasksMonthPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i13.TasksSingleDayPage]
class TasksSingleDayPage extends _i15.PageRouteInfo<void> {
  const TasksSingleDayPage({List<_i15.PageRouteInfo>? children})
      : super(
          TasksSingleDayPage.name,
          initialChildren: children,
        );

  static const String name = 'TasksSingleDayPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}

/// generated route for
/// [_i14.UserSearchPage]
class UserSearchPage extends _i15.PageRouteInfo<void> {
  const UserSearchPage({List<_i15.PageRouteInfo>? children})
      : super(
          UserSearchPage.name,
          initialChildren: children,
        );

  static const String name = 'UserSearchPage';

  static const _i15.PageInfo<void> page = _i15.PageInfo<void>(name);
}
