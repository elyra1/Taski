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
import 'package:firebase_storage/firebase_storage.dart' as _i10;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:taski/data/notifications/firebase_notifications_service.dart'
    as _i7;
import 'package:taski/data/repo_impl/categories_repo_impl.dart' as _i19;
import 'package:taski/data/repo_impl/photo_repo_impl.dart' as _i9;
import 'package:taski/data/repo_impl/task_repo_impl.dart' as _i12;
import 'package:taski/data/repo_impl/user_repo_impl.dart' as _i14;
import 'package:taski/di/app_module.dart' as _i34;
import 'package:taski/domain/repositories/category_repository.dart' as _i18;
import 'package:taski/domain/repositories/photo_repository.dart' as _i8;
import 'package:taski/domain/repositories/task_repository.dart' as _i11;
import 'package:taski/domain/repositories/user_repository.dart' as _i13;
import 'package:taski/presentation/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i33;
import 'package:taski/presentation/pages/category_page/cubit/category_page_cubit.dart'
    as _i17;
import 'package:taski/presentation/pages/create_category_page/cubit/create_category_page_cubit.dart'
    as _i20;
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart'
    as _i21;
import 'package:taski/presentation/pages/edit_profile_page/cubit/edit_profile_page_cubit.dart'
    as _i22;
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart'
    as _i23;
import 'package:taski/presentation/pages/friends_page/cubit/friends_page_cubit.dart'
    as _i24;
import 'package:taski/presentation/pages/home_page/cubit/home_page_cubit.dart'
    as _i25;
import 'package:taski/presentation/pages/profile_page/cubit/profile_page_cubit.dart'
    as _i26;
import 'package:taski/presentation/pages/send_reset_link/cubit/send_reset_link_page_cubit.dart'
    as _i27;
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart'
    as _i28;
import 'package:taski/presentation/pages/sign_up/cubit/sign_up_page_cubit.dart'
    as _i29;
import 'package:taski/presentation/pages/task_page/cubit/task_page_cubit.dart'
    as _i30;
import 'package:taski/presentation/pages/tasks_month/cubit/tasks_month_page_cubit.dart'
    as _i31;
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart'
    as _i32;
import 'package:taski/presentation/pages/user_search_page/cubit/user_search_page_cubit.dart'
    as _i15;
import 'package:taski/presentation/pages/week_tasks/cubit/week_tasks_page_cubit.dart'
    as _i16;

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
    gh.singleton<_i8.PhotoRepository>(
        _i9.PhotoRepoImpl(gh<_i10.FirebaseStorage>()));
    gh.singleton<_i11.TaskRepository>(
        _i12.TaskRepoImpl(gh<_i5.FirebaseFirestore>()));
    gh.singleton<_i13.UserRepository>(_i14.UserRepoImpl(
      gh<_i4.FirebaseAuth>(),
      gh<_i5.FirebaseFirestore>(),
    ));
    gh.factory<_i15.UserSearchPageCubit>(
        () => _i15.UserSearchPageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i16.WeekTasksPageCubit>(() => _i16.WeekTasksPageCubit(
          gh<_i11.TaskRepository>(),
          gh<_i13.UserRepository>(),
        ));
    gh.factory<_i17.CategoryPageCubit>(
        () => _i17.CategoryPageCubit(gh<_i11.TaskRepository>()));
    gh.singleton<_i18.CategoryRepository>(_i19.CategoriesRepoImpl(
      gh<_i5.FirebaseFirestore>(),
      gh<_i4.FirebaseAuth>(),
    ));
    gh.factory<_i20.CreateCategoryPageCubit>(() => _i20.CreateCategoryPageCubit(
          gh<_i18.CategoryRepository>(),
          gh<_i13.UserRepository>(),
          gh<_i11.TaskRepository>(),
        ));
    gh.factory<_i21.CreateTaskCubit>(() => _i21.CreateTaskCubit(
          gh<_i11.TaskRepository>(),
          gh<_i13.UserRepository>(),
          gh<_i18.CategoryRepository>(),
        ));
    gh.factory<_i22.EditProfilePageCubit>(
        () => _i22.EditProfilePageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i23.ExamplePageCubit>(() => _i23.ExamplePageCubit(
          gh<_i11.TaskRepository>(),
          gh<_i13.UserRepository>(),
        ));
    gh.factory<_i24.FriendsPageCubit>(
        () => _i24.FriendsPageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i25.HomePageCubit>(
        () => _i25.HomePageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i26.ProfilePageCubit>(
        () => _i26.ProfilePageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i27.SendResetLinkPageCubit>(
        () => _i27.SendResetLinkPageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i28.SignInPageCubit>(
        () => _i28.SignInPageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i29.SignUpPageCubit>(
        () => _i29.SignUpPageCubit(gh<_i13.UserRepository>()));
    gh.factory<_i30.TaskPageCubit>(
        () => _i30.TaskPageCubit(gh<_i18.CategoryRepository>()));
    gh.factory<_i31.TasksMonthPageCubit>(() => _i31.TasksMonthPageCubit(
          gh<_i11.TaskRepository>(),
          gh<_i13.UserRepository>(),
        ));
    gh.factory<_i32.TasksSingleDayPageCubit>(() => _i32.TasksSingleDayPageCubit(
          gh<_i11.TaskRepository>(),
          gh<_i13.UserRepository>(),
        ));
    gh.factory<_i33.CategoriesPageCubit>(
        () => _i33.CategoriesPageCubit(gh<_i18.CategoryRepository>()));
    return this;
  }
}

class _$AppModule extends _i34.AppModule {}
