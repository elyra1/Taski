// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i17;
import 'package:flutter/cupertino.dart' as _i22;
import 'package:flutter/material.dart' as _i18;
import 'package:taski/domain/entities/category.dart' as _i19;
import 'package:taski/domain/entities/task.dart' as _i20;
import 'package:taski/domain/entities/user_model.dart' as _i21;
import 'package:taski/presentation/pages/categories_page/categories_page.dart'
    as _i1;
import 'package:taski/presentation/pages/category_page/category_page.dart'
    as _i2;
import 'package:taski/presentation/pages/create_task/create_task_page.dart'
    as _i3;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i4;
import 'package:taski/presentation/pages/friends_page/friends_page.dart' as _i5;
import 'package:taski/presentation/pages/home_page/home_page.dart' as _i6;
import 'package:taski/presentation/pages/profile_page/profile_page.dart' as _i7;
import 'package:taski/presentation/pages/send_reset_link/send_reset_link_page.dart'
    as _i8;
import 'package:taski/presentation/pages/sended_reset_link/sended_reset_link_page.dart'
    as _i9;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i10;
import 'package:taski/presentation/pages/sign_up/sign_up_page.dart' as _i11;
import 'package:taski/presentation/pages/task_page/task_page.dart' as _i12;
import 'package:taski/presentation/pages/tasks_month/tasks_month_page.dart'
    as _i13;
import 'package:taski/presentation/pages/tasks_single_day/tasks_single_day_page.dart'
    as _i14;
import 'package:taski/presentation/pages/user_search_page/user_search_page.dart'
    as _i15;
import 'package:taski/presentation/pages/week_tasks/week_tasks_page.dart'
    as _i16;

abstract class $AppRouter extends _i17.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i17.PageFactory> pagesMap = {
    CategoriesPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i1.CategoriesPage()),
      );
    },
    CategoryPage.name: (routeData) {
      final args = routeData.argsAs<CategoryPageArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i2.CategoryPage(
          key: args.key,
          category: args.category,
        )),
      );
    },
    CreateTaskPage.name: (routeData) {
      final args = routeData.argsAs<CreateTaskPageArgs>(
          orElse: () => const CreateTaskPageArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i3.CreateTaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    ExamplePage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i4.ExamplePage()),
      );
    },
    FriendsPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i5.FriendsPage()),
      );
    },
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i6.HomePage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    ProfilePage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i7.ProfilePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i8.SendResetLinkPage()),
      );
    },
    SendedResetLinkPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i9.SendedResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i10.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i11.SignUpPage()),
      );
    },
    TaskPage.name: (routeData) {
      final args = routeData.argsAs<TaskPageArgs>();
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i12.TaskPage(
          key: args.key,
          task: args.task,
        ),
      );
    },
    TasksMonthPage.name: (routeData) {
      final args = routeData.argsAs<TasksMonthPageArgs>(
          orElse: () => const TasksMonthPageArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i13.TasksMonthPage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    TasksSingleDayPage.name: (routeData) {
      final args = routeData.argsAs<TasksSingleDayPageArgs>(
          orElse: () => const TasksSingleDayPageArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i14.TasksSingleDayPage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    UserSearchPage.name: (routeData) {
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(child: const _i15.UserSearchPage()),
      );
    },
    WeekTasksPage.name: (routeData) {
      final args = routeData.argsAs<WeekTasksPageArgs>(
          orElse: () => const WeekTasksPageArgs());
      return _i17.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i17.WrappedRoute(
            child: _i16.WeekTasksPage(
          key: args.key,
          user: args.user,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesPage extends _i17.PageRouteInfo<void> {
  const CategoriesPage({List<_i17.PageRouteInfo>? children})
      : super(
          CategoriesPage.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryPage]
class CategoryPage extends _i17.PageRouteInfo<CategoryPageArgs> {
  CategoryPage({
    _i18.Key? key,
    required _i19.Category category,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CategoryPage.name,
          args: CategoryPageArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryPage';

  static const _i17.PageInfo<CategoryPageArgs> page =
      _i17.PageInfo<CategoryPageArgs>(name);
}

class CategoryPageArgs {
  const CategoryPageArgs({
    this.key,
    required this.category,
  });

  final _i18.Key? key;

  final _i19.Category category;

  @override
  String toString() {
    return 'CategoryPageArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i3.CreateTaskPage]
class CreateTaskPage extends _i17.PageRouteInfo<CreateTaskPageArgs> {
  CreateTaskPage({
    _i18.Key? key,
    _i20.Task? task,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          CreateTaskPage.name,
          args: CreateTaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTaskPage';

  static const _i17.PageInfo<CreateTaskPageArgs> page =
      _i17.PageInfo<CreateTaskPageArgs>(name);
}

class CreateTaskPageArgs {
  const CreateTaskPageArgs({
    this.key,
    this.task,
  });

  final _i18.Key? key;

  final _i20.Task? task;

  @override
  String toString() {
    return 'CreateTaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i4.ExamplePage]
class ExamplePage extends _i17.PageRouteInfo<void> {
  const ExamplePage({List<_i17.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i5.FriendsPage]
class FriendsPage extends _i17.PageRouteInfo<void> {
  const FriendsPage({List<_i17.PageRouteInfo>? children})
      : super(
          FriendsPage.name,
          initialChildren: children,
        );

  static const String name = 'FriendsPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomePage]
class HomePage extends _i17.PageRouteInfo<HomePageArgs> {
  HomePage({
    _i18.Key? key,
    _i21.UserModel? user,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          HomePage.name,
          args: HomePageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i17.PageInfo<HomePageArgs> page =
      _i17.PageInfo<HomePageArgs>(name);
}

class HomePageArgs {
  const HomePageArgs({
    this.key,
    this.user,
  });

  final _i18.Key? key;

  final _i21.UserModel? user;

  @override
  String toString() {
    return 'HomePageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i7.ProfilePage]
class ProfilePage extends _i17.PageRouteInfo<void> {
  const ProfilePage({List<_i17.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i8.SendResetLinkPage]
class SendResetLinkPage extends _i17.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i17.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SendedResetLinkPage]
class SendedResetLinkPage extends _i17.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i17.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SignInPage]
class SignInPage extends _i17.PageRouteInfo<void> {
  const SignInPage({List<_i17.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SignUpPage]
class SignUpPage extends _i17.PageRouteInfo<void> {
  const SignUpPage({List<_i17.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i12.TaskPage]
class TaskPage extends _i17.PageRouteInfo<TaskPageArgs> {
  TaskPage({
    _i18.Key? key,
    required _i20.Task task,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          TaskPage.name,
          args: TaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskPage';

  static const _i17.PageInfo<TaskPageArgs> page =
      _i17.PageInfo<TaskPageArgs>(name);
}

class TaskPageArgs {
  const TaskPageArgs({
    this.key,
    required this.task,
  });

  final _i18.Key? key;

  final _i20.Task task;

  @override
  String toString() {
    return 'TaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i13.TasksMonthPage]
class TasksMonthPage extends _i17.PageRouteInfo<TasksMonthPageArgs> {
  TasksMonthPage({
    _i22.Key? key,
    _i21.UserModel? user,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          TasksMonthPage.name,
          args: TasksMonthPageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'TasksMonthPage';

  static const _i17.PageInfo<TasksMonthPageArgs> page =
      _i17.PageInfo<TasksMonthPageArgs>(name);
}

class TasksMonthPageArgs {
  const TasksMonthPageArgs({
    this.key,
    this.user,
  });

  final _i22.Key? key;

  final _i21.UserModel? user;

  @override
  String toString() {
    return 'TasksMonthPageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i14.TasksSingleDayPage]
class TasksSingleDayPage extends _i17.PageRouteInfo<TasksSingleDayPageArgs> {
  TasksSingleDayPage({
    _i18.Key? key,
    _i21.UserModel? user,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          TasksSingleDayPage.name,
          args: TasksSingleDayPageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'TasksSingleDayPage';

  static const _i17.PageInfo<TasksSingleDayPageArgs> page =
      _i17.PageInfo<TasksSingleDayPageArgs>(name);
}

class TasksSingleDayPageArgs {
  const TasksSingleDayPageArgs({
    this.key,
    this.user,
  });

  final _i18.Key? key;

  final _i21.UserModel? user;

  @override
  String toString() {
    return 'TasksSingleDayPageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i15.UserSearchPage]
class UserSearchPage extends _i17.PageRouteInfo<void> {
  const UserSearchPage({List<_i17.PageRouteInfo>? children})
      : super(
          UserSearchPage.name,
          initialChildren: children,
        );

  static const String name = 'UserSearchPage';

  static const _i17.PageInfo<void> page = _i17.PageInfo<void>(name);
}

/// generated route for
/// [_i16.WeekTasksPage]
class WeekTasksPage extends _i17.PageRouteInfo<WeekTasksPageArgs> {
  WeekTasksPage({
    _i18.Key? key,
    _i21.UserModel? user,
    List<_i17.PageRouteInfo>? children,
  }) : super(
          WeekTasksPage.name,
          args: WeekTasksPageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'WeekTasksPage';

  static const _i17.PageInfo<WeekTasksPageArgs> page =
      _i17.PageInfo<WeekTasksPageArgs>(name);
}

class WeekTasksPageArgs {
  const WeekTasksPageArgs({
    this.key,
    this.user,
  });

  final _i18.Key? key;

  final _i21.UserModel? user;

  @override
  String toString() {
    return 'WeekTasksPageArgs{key: $key, user: $user}';
  }
}
