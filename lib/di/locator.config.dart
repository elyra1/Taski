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
import 'package:taski/data/datasources/auth_data_source.dart' as _i11;
import 'package:taski/data/datasources/categories_data_source.dart' as _i14;
import 'package:taski/data/datasources/firebase_notifications_service.dart'
    as _i7;
import 'package:taski/data/datasources/tasks_data_sourse.dart' as _i9;
import 'package:taski/di/app_module.dart' as _i30;
import 'package:taski/domain/repositories/auth_repository.dart' as _i10;
import 'package:taski/domain/repositories/category_repository.dart' as _i13;
import 'package:taski/domain/repositories/task_repository.dart' as _i8;
import 'package:taski/presentation/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i29;
import 'package:taski/presentation/pages/category_page/cubit/category_page_cubit.dart'
    as _i12;
import 'package:taski/presentation/pages/create_category_page/cubit/create_category_page_cubit.dart'
    as _i15;
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart'
    as _i16;
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart'
    as _i17;
import 'package:taski/presentation/pages/friends_page/cubit/friends_page_cubit.dart'
    as _i18;
import 'package:taski/presentation/pages/home_page/cubit/home_page_cubit.dart'
    as _i19;
import 'package:taski/presentation/pages/profile_page/cubit/profile_page_cubit.dart'
    as _i20;
import 'package:taski/presentation/pages/send_reset_link/cubit/send_reset_link_page_cubit.dart'
    as _i21;
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart'
    as _i22;
import 'package:taski/presentation/pages/sign_up/cubit/sign_up_page_cubit.dart'
    as _i23;
import 'package:taski/presentation/pages/task_page/cubit/task_page_cubit.dart'
    as _i24;
import 'package:taski/presentation/pages/tasks_month/cubit/tasks_month_page_cubit.dart'
    as _i25;
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart'
    as _i26;
import 'package:taski/presentation/pages/user_search_page/cubit/user_search_page_cubit.dart'
    as _i27;
import 'package:taski/presentation/pages/week_tasks/cubit/week_tasks_page_cubit.dart'
    as _i28;

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
        () => _i7.FirebaseNotificationService(
              gh<_i6.FirebaseMessaging>(),
              gh<_i4.FirebaseAuth>(),
            ));
    gh.singleton<_i8.TaskRepository>(
        _i9.TaskDataSource(gh<_i5.FirebaseFirestore>()));
    gh.singleton<_i10.AuthRepository>(_i11.AuthDataSource(
      gh<_i4.FirebaseAuth>(),
      gh<_i5.FirebaseFirestore>(),
    ));
    gh.factory<_i12.CategoryPageCubit>(
        () => _i12.CategoryPageCubit(gh<_i8.TaskRepository>()));
    gh.singleton<_i13.CategoryRepository>(_i14.CategoriesDataSource(
      gh<_i5.FirebaseFirestore>(),
      gh<_i4.FirebaseAuth>(),
    ));
    gh.factory<_i15.CreateCategoryPageCubit>(() => _i15.CreateCategoryPageCubit(
          gh<_i13.CategoryRepository>(),
          gh<_i10.AuthRepository>(),
          gh<_i8.TaskRepository>(),
        ));
    gh.factory<_i16.CreateTaskCubit>(() => _i16.CreateTaskCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.AuthRepository>(),
          gh<_i13.CategoryRepository>(),
        ));
    gh.factory<_i17.ExamplePageCubit>(() => _i17.ExamplePageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.AuthRepository>(),
        ));
    gh.factory<_i18.FriendsPageCubit>(
        () => _i18.FriendsPageCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i19.HomePageCubit>(
        () => _i19.HomePageCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i20.ProfilePageCubit>(
        () => _i20.ProfilePageCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i21.SendResetLinkPageCubit>(
        () => _i21.SendResetLinkPageCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i22.SignInPageCubit>(
        () => _i22.SignInPageCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i23.SignUpPageCubit>(
        () => _i23.SignUpPageCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i24.TaskPageCubit>(
        () => _i24.TaskPageCubit(gh<_i13.CategoryRepository>()));
    gh.factory<_i25.TasksMonthPageCubit>(() => _i25.TasksMonthPageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.AuthRepository>(),
        ));
    gh.factory<_i26.TasksSingleDayPageCubit>(() => _i26.TasksSingleDayPageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.AuthRepository>(),
        ));
    gh.factory<_i27.UserSearchPageCubit>(
        () => _i27.UserSearchPageCubit(gh<_i10.AuthRepository>()));
    gh.factory<_i28.WeekTasksPageCubit>(() => _i28.WeekTasksPageCubit(
          gh<_i8.TaskRepository>(),
          gh<_i10.AuthRepository>(),
        ));
    gh.factory<_i29.CategoriesPageCubit>(
        () => _i29.CategoriesPageCubit(gh<_i13.CategoryRepository>()));
    return this;
  }
}

class _$AppModule extends _i30.AppModule {}
