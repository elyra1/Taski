// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i5;
import 'package:firebase_analytics/firebase_analytics.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i4;
import 'package:firebase_messaging/firebase_messaging.dart' as _i6;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:taski/data/notifications/firebase_notifications_service.dart'
    as _i7;
import 'package:taski/data/repo_impl/categories_repo_impl.dart' as _i16;
import 'package:taski/data/repo_impl/task_repo_impl.dart' as _i9;
import 'package:taski/data/repo_impl/user_repo_impl.dart' as _i11;
import 'package:taski/di/app_module.dart' as _i31;
import 'package:taski/domain/repositories/category_repository.dart' as _i15;
import 'package:taski/domain/repositories/task_repository.dart' as _i8;
import 'package:taski/domain/repositories/user_repository.dart' as _i10;
import 'package:taski/presentation/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i30;
import 'package:taski/presentation/pages/category_page/cubit/category_page_cubit.dart'
    as _i14;
import 'package:taski/presentation/pages/create_category_page/cubit/create_category_page_cubit.dart'
    as _i17;
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart'
    as _i18;
import 'package:taski/presentation/pages/edit_profile_page/cubit/edit_profile_page_cubit.dart'
    as _i19;
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart'
    as _i20;
import 'package:taski/presentation/pages/friends_page/cubit/friends_page_cubit.dart'
    as _i21;
import 'package:taski/presentation/pages/home_page/cubit/home_page_cubit.dart'
    as _i22;
import 'package:taski/presentation/pages/profile_page/cubit/profile_page_cubit.dart'
    as _i23;
import 'package:taski/presentation/pages/send_reset_link/cubit/send_reset_link_page_cubit.dart'
    as _i24;
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart'
    as _i25;
import 'package:taski/presentation/pages/sign_up/cubit/sign_up_page_cubit.dart'
    as _i26;
import 'package:taski/presentation/pages/task_page/cubit/task_page_cubit.dart'
    as _i27;
import 'package:taski/presentation/pages/tasks_month/cubit/tasks_month_page_cubit.dart'
    as _i28;
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart'
    as _i29;
import 'package:taski/presentation/pages/user_search_page/cubit/user_search_page_cubit.dart'
    as _i12;
import 'package:taski/presentation/pages/week_tasks/cubit/week_tasks_page_cubit.dart'
    as _i13;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final appModule = _$AppModule();
    gh.singleton<_i3.FirebaseAnalytics>(appModule.firebaseAnalytics());
    gh.singleton<_i4.FirebaseAuth>(appModule.firebaseAuth());
    gh.singleton<_i5.FirebaseFirestore>(appModule.fireStore());
    gh.singleton<_i6.FirebaseMessaging>(appModule.firebaseMessaging());
    gh.factory<_i7.FirebaseNotificationService>(
        () => _i7.FirebaseNotificationService(gh<_i6.FirebaseMessaging>()));
    gh.singleton<_i8.TaskRepository>(
        _i9.TaskRepoImpl(gh<_i5.FirebaseFirestore>()));
    gh.singleton<_i10.UserRepository>(_i11.UserRepoImpl(
      gh<_i4.FirebaseAuth>(),
      gh<_i5.FirebaseFirestore>(),
    ));
    gh.factory<_i12.UserSearchPageCubit>(
        () => _i12.UserSearchPageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i13.WeekTasksPageCubit>(() => _i13.WeekTasksPageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.UserRepository>(),
        ));
    gh.factory<_i14.CategoryPageCubit>(
        () => _i14.CategoryPageCubit(gh<_i8.TaskRepository>()));
    gh.singleton<_i15.CategoryRepository>(_i16.CategoriesRepoImpl(
      gh<_i5.FirebaseFirestore>(),
      gh<_i4.FirebaseAuth>(),
    ));
    gh.factory<_i17.CreateCategoryPageCubit>(() => _i17.CreateCategoryPageCubit(
          gh<_i15.CategoryRepository>(),
          gh<_i10.UserRepository>(),
          gh<_i8.TaskRepository>(),
        ));
    gh.factory<_i18.CreateTaskCubit>(() => _i18.CreateTaskCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.UserRepository>(),
          gh<_i15.CategoryRepository>(),
        ));
    gh.factory<_i19.EditProfilePageCubit>(
        () => _i19.EditProfilePageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i20.ExamplePageCubit>(() => _i20.ExamplePageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.UserRepository>(),
        ));
    gh.factory<_i21.FriendsPageCubit>(
        () => _i21.FriendsPageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i22.HomePageCubit>(
        () => _i22.HomePageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i23.ProfilePageCubit>(
        () => _i23.ProfilePageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i24.SendResetLinkPageCubit>(
        () => _i24.SendResetLinkPageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i25.SignInPageCubit>(
        () => _i25.SignInPageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i26.SignUpPageCubit>(
        () => _i26.SignUpPageCubit(gh<_i10.UserRepository>()));
    gh.factory<_i27.TaskPageCubit>(
        () => _i27.TaskPageCubit(gh<_i15.CategoryRepository>()));
    gh.factory<_i28.TasksMonthPageCubit>(() => _i28.TasksMonthPageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.UserRepository>(),
        ));
    gh.factory<_i29.TasksSingleDayPageCubit>(() => _i29.TasksSingleDayPageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.UserRepository>(),
        ));
    gh.factory<_i30.CategoriesPageCubit>(
        () => _i30.CategoriesPageCubit(gh<_i15.CategoryRepository>()));
    return this;
  }
}

class _$AppModule extends _i31.AppModule {}
