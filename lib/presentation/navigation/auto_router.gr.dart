// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i19;
import 'package:flutter/material.dart' as _i20;
import 'package:taski/domain/entities/category.dart' as _i21;
import 'package:taski/domain/entities/task.dart' as _i22;
import 'package:taski/domain/entities/user_model.dart' as _i23;
import 'package:taski/presentation/pages/categories_page/categories_page.dart'
    as _i1;
import 'package:taski/presentation/pages/category_page/category_page.dart'
    as _i2;
import 'package:taski/presentation/pages/create_category_page/create_category_page.dart'
    as _i3;
import 'package:taski/presentation/pages/create_task/create_task_page.dart'
    as _i4;
import 'package:taski/presentation/pages/edit_profile_page/edit_profile_page.dart'
    as _i5;
import 'package:taski/presentation/pages/example_page/example_page.dart' as _i6;
import 'package:taski/presentation/pages/friends_page/friends_page.dart' as _i7;
import 'package:taski/presentation/pages/home_page/home_page.dart' as _i8;
import 'package:taski/presentation/pages/profile_page/profile_page.dart' as _i9;
import 'package:taski/presentation/pages/send_reset_link/send_reset_link_page.dart'
    as _i10;
import 'package:taski/presentation/pages/sended_reset_link/sended_reset_link_page.dart'
    as _i11;
import 'package:taski/presentation/pages/sign_in/sign_in_page.dart' as _i12;
import 'package:taski/presentation/pages/sign_up/sign_up_page.dart' as _i13;
import 'package:taski/presentation/pages/task_page/task_page.dart' as _i14;
import 'package:taski/presentation/pages/tasks_month/tasks_month_page.dart'
    as _i15;
import 'package:taski/presentation/pages/tasks_single_day/tasks_single_day_page.dart'
    as _i16;
import 'package:taski/presentation/pages/user_search_page/user_search_page.dart'
    as _i17;
import 'package:taski/presentation/pages/week_tasks/week_tasks_page.dart'
    as _i18;

abstract class $AppRouter extends _i19.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i19.PageFactory> pagesMap = {
    CategoriesPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i1.CategoriesPage()),
      );
    },
    CategoryPage.name: (routeData) {
      final args = routeData.argsAs<CategoryPageArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i2.CategoryPage(
          key: args.key,
          category: args.category,
        )),
      );
    },
    CreateCategoryPage.name: (routeData) {
      final args = routeData.argsAs<CreateCategoryPageArgs>(
          orElse: () => const CreateCategoryPageArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i3.CreateCategoryPage(
          key: args.key,
          category: args.category,
        )),
      );
    },
    CreateTaskPage.name: (routeData) {
      final args = routeData.argsAs<CreateTaskPageArgs>(
          orElse: () => const CreateTaskPageArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i4.CreateTaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    EditProfilePage.name: (routeData) {
      final args = routeData.argsAs<EditProfilePageArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i5.EditProfilePage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    ExamplePage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i6.ExamplePage()),
      );
    },
    FriendsPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i7.FriendsPage()),
      );
    },
    HomePage.name: (routeData) {
      final args =
          routeData.argsAs<HomePageArgs>(orElse: () => const HomePageArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i8.HomePage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    ProfilePage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i9.ProfilePage()),
      );
    },
    SendResetLinkPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i10.SendResetLinkPage()),
      );
    },
    SendedResetLinkPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i11.SendedResetLinkPage()),
      );
    },
    SignInPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i12.SignInPage()),
      );
    },
    SignUpPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i13.SignUpPage()),
      );
    },
    TaskPage.name: (routeData) {
      final args = routeData.argsAs<TaskPageArgs>();
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i14.TaskPage(
          key: args.key,
          task: args.task,
        )),
      );
    },
    TasksMonthPage.name: (routeData) {
      final args = routeData.argsAs<TasksMonthPageArgs>(
          orElse: () => const TasksMonthPageArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i15.TasksMonthPage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    TasksSingleDayPage.name: (routeData) {
      final args = routeData.argsAs<TasksSingleDayPageArgs>(
          orElse: () => const TasksSingleDayPageArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i16.TasksSingleDayPage(
          key: args.key,
          user: args.user,
        )),
      );
    },
    UserSearchPage.name: (routeData) {
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(child: const _i17.UserSearchPage()),
      );
    },
    WeekTasksPage.name: (routeData) {
      final args = routeData.argsAs<WeekTasksPageArgs>(
          orElse: () => const WeekTasksPageArgs());
      return _i19.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i19.WrappedRoute(
            child: _i18.WeekTasksPage(
          key: args.key,
          user: args.user,
        )),
      );
    },
  };
}

/// generated route for
/// [_i1.CategoriesPage]
class CategoriesPage extends _i19.PageRouteInfo<void> {
  const CategoriesPage({List<_i19.PageRouteInfo>? children})
      : super(
          CategoriesPage.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CategoryPage]
class CategoryPage extends _i19.PageRouteInfo<CategoryPageArgs> {
  CategoryPage({
    _i20.Key? key,
    required _i21.Category category,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CategoryPage.name,
          args: CategoryPageArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryPage';

  static const _i19.PageInfo<CategoryPageArgs> page =
      _i19.PageInfo<CategoryPageArgs>(name);
}

class CategoryPageArgs {
  const CategoryPageArgs({
    this.key,
    required this.category,
  });

  final _i20.Key? key;

  final _i21.Category category;

  @override
  String toString() {
    return 'CategoryPageArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i3.CreateCategoryPage]
class CreateCategoryPage extends _i19.PageRouteInfo<CreateCategoryPageArgs> {
  CreateCategoryPage({
    _i20.Key? key,
    _i21.Category? category,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CreateCategoryPage.name,
          args: CreateCategoryPageArgs(
            key: key,
            category: category,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateCategoryPage';

  static const _i19.PageInfo<CreateCategoryPageArgs> page =
      _i19.PageInfo<CreateCategoryPageArgs>(name);
}

class CreateCategoryPageArgs {
  const CreateCategoryPageArgs({
    this.key,
    this.category,
  });

  final _i20.Key? key;

  final _i21.Category? category;

  @override
  String toString() {
    return 'CreateCategoryPageArgs{key: $key, category: $category}';
  }
}

/// generated route for
/// [_i4.CreateTaskPage]
class CreateTaskPage extends _i19.PageRouteInfo<CreateTaskPageArgs> {
  CreateTaskPage({
    _i20.Key? key,
    _i22.Task? task,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          CreateTaskPage.name,
          args: CreateTaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'CreateTaskPage';

  static const _i19.PageInfo<CreateTaskPageArgs> page =
      _i19.PageInfo<CreateTaskPageArgs>(name);
}

class CreateTaskPageArgs {
  const CreateTaskPageArgs({
    this.key,
    this.task,
  });

  final _i20.Key? key;

  final _i22.Task? task;

  @override
  String toString() {
    return 'CreateTaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i5.EditProfilePage]
class EditProfilePage extends _i19.PageRouteInfo<EditProfilePageArgs> {
  EditProfilePage({
    _i20.Key? key,
    required _i23.UserModel user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          EditProfilePage.name,
          args: EditProfilePageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'EditProfilePage';

  static const _i19.PageInfo<EditProfilePageArgs> page =
      _i19.PageInfo<EditProfilePageArgs>(name);
}

class EditProfilePageArgs {
  const EditProfilePageArgs({
    this.key,
    required this.user,
  });

  final _i20.Key? key;

  final _i23.UserModel user;

  @override
  String toString() {
    return 'EditProfilePageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i6.ExamplePage]
class ExamplePage extends _i19.PageRouteInfo<void> {
  const ExamplePage({List<_i19.PageRouteInfo>? children})
      : super(
          ExamplePage.name,
          initialChildren: children,
        );

  static const String name = 'ExamplePage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i7.FriendsPage]
class FriendsPage extends _i19.PageRouteInfo<void> {
  const FriendsPage({List<_i19.PageRouteInfo>? children})
      : super(
          FriendsPage.name,
          initialChildren: children,
        );

  static const String name = 'FriendsPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i8.HomePage]
class HomePage extends _i19.PageRouteInfo<HomePageArgs> {
  HomePage({
    _i20.Key? key,
    _i23.UserModel? user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          HomePage.name,
          args: HomePageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'HomePage';

  static const _i19.PageInfo<HomePageArgs> page =
      _i19.PageInfo<HomePageArgs>(name);
}

class HomePageArgs {
  const HomePageArgs({
    this.key,
    this.user,
  });

  final _i20.Key? key;

  final _i23.UserModel? user;

  @override
  String toString() {
    return 'HomePageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i9.ProfilePage]
class ProfilePage extends _i19.PageRouteInfo<void> {
  const ProfilePage({List<_i19.PageRouteInfo>? children})
      : super(
          ProfilePage.name,
          initialChildren: children,
        );

  static const String name = 'ProfilePage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i10.SendResetLinkPage]
class SendResetLinkPage extends _i19.PageRouteInfo<void> {
  const SendResetLinkPage({List<_i19.PageRouteInfo>? children})
      : super(
          SendResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendResetLinkPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i11.SendedResetLinkPage]
class SendedResetLinkPage extends _i19.PageRouteInfo<void> {
  const SendedResetLinkPage({List<_i19.PageRouteInfo>? children})
      : super(
          SendedResetLinkPage.name,
          initialChildren: children,
        );

  static const String name = 'SendedResetLinkPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i12.SignInPage]
class SignInPage extends _i19.PageRouteInfo<void> {
  const SignInPage({List<_i19.PageRouteInfo>? children})
      : super(
          SignInPage.name,
          initialChildren: children,
        );

  static const String name = 'SignInPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i13.SignUpPage]
class SignUpPage extends _i19.PageRouteInfo<void> {
  const SignUpPage({List<_i19.PageRouteInfo>? children})
      : super(
          SignUpPage.name,
          initialChildren: children,
        );

  static const String name = 'SignUpPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i14.TaskPage]
class TaskPage extends _i19.PageRouteInfo<TaskPageArgs> {
  TaskPage({
    _i20.Key? key,
    required _i22.Task task,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          TaskPage.name,
          args: TaskPageArgs(
            key: key,
            task: task,
          ),
          initialChildren: children,
        );

  static const String name = 'TaskPage';

  static const _i19.PageInfo<TaskPageArgs> page =
      _i19.PageInfo<TaskPageArgs>(name);
}

class TaskPageArgs {
  const TaskPageArgs({
    this.key,
    required this.task,
  });

  final _i20.Key? key;

  final _i22.Task task;

  @override
  String toString() {
    return 'TaskPageArgs{key: $key, task: $task}';
  }
}

/// generated route for
/// [_i15.TasksMonthPage]
class TasksMonthPage extends _i19.PageRouteInfo<TasksMonthPageArgs> {
  TasksMonthPage({
    _i20.Key? key,
    _i23.UserModel? user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          TasksMonthPage.name,
          args: TasksMonthPageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'TasksMonthPage';

  static const _i19.PageInfo<TasksMonthPageArgs> page =
      _i19.PageInfo<TasksMonthPageArgs>(name);
}

class TasksMonthPageArgs {
  const TasksMonthPageArgs({
    this.key,
    this.user,
  });

  final _i20.Key? key;

  final _i23.UserModel? user;

  @override
  String toString() {
    return 'TasksMonthPageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i16.TasksSingleDayPage]
class TasksSingleDayPage extends _i19.PageRouteInfo<TasksSingleDayPageArgs> {
  TasksSingleDayPage({
    _i20.Key? key,
    _i23.UserModel? user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          TasksSingleDayPage.name,
          args: TasksSingleDayPageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'TasksSingleDayPage';

  static const _i19.PageInfo<TasksSingleDayPageArgs> page =
      _i19.PageInfo<TasksSingleDayPageArgs>(name);
}

class TasksSingleDayPageArgs {
  const TasksSingleDayPageArgs({
    this.key,
    this.user,
  });

  final _i20.Key? key;

  final _i23.UserModel? user;

  @override
  String toString() {
    return 'TasksSingleDayPageArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i17.UserSearchPage]
class UserSearchPage extends _i19.PageRouteInfo<void> {
  const UserSearchPage({List<_i19.PageRouteInfo>? children})
      : super(
          UserSearchPage.name,
          initialChildren: children,
        );

  static const String name = 'UserSearchPage';

  static const _i19.PageInfo<void> page = _i19.PageInfo<void>(name);
}

/// generated route for
/// [_i18.WeekTasksPage]
class WeekTasksPage extends _i19.PageRouteInfo<WeekTasksPageArgs> {
  WeekTasksPage({
    _i20.Key? key,
    _i23.UserModel? user,
    List<_i19.PageRouteInfo>? children,
  }) : super(
          WeekTasksPage.name,
          args: WeekTasksPageArgs(
            key: key,
            user: user,
          ),
          initialChildren: children,
        );

  static const String name = 'WeekTasksPage';

  static const _i19.PageInfo<WeekTasksPageArgs> page =
      _i19.PageInfo<WeekTasksPageArgs>(name);
}

class WeekTasksPageArgs {
  const WeekTasksPageArgs({
    this.key,
    this.user,
  });

  final _i20.Key? key;

  final _i23.UserModel? user;

  @override
  String toString() {
    return 'WeekTasksPageArgs{key: $key, user: $user}';
  }
}
