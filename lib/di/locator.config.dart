// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i4;
import 'package:firebase_auth/firebase_auth.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:taski/data/datasources/auth_data_source.dart' as _i8;
import 'package:taski/data/datasources/categories_data_source.dart' as _i11;
import 'package:taski/data/datasources/tasks_data_sourse.dart' as _i6;
import 'package:taski/di/app_module.dart' as _i27;
import 'package:taski/domain/repositories/auth_repository.dart' as _i7;
import 'package:taski/domain/repositories/category_repository.dart' as _i10;
import 'package:taski/domain/repositories/task_repository.dart' as _i5;
import 'package:taski/presentation/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i26;
import 'package:taski/presentation/pages/category_page/cubit/category_page_cubit.dart'
    as _i9;
import 'package:taski/presentation/pages/create_category_page/cubit/create_category_page_cubit.dart'
    as _i12;
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart'
    as _i13;
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart'
    as _i14;
import 'package:taski/presentation/pages/friends_page/cubit/friends_page_cubit.dart'
    as _i15;
import 'package:taski/presentation/pages/home_page/cubit/home_page_cubit.dart'
    as _i16;
import 'package:taski/presentation/pages/profile_page/cubit/profile_page_cubit.dart'
    as _i17;
import 'package:taski/presentation/pages/send_reset_link/cubit/send_reset_link_page_cubit.dart'
    as _i18;
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart'
    as _i19;
import 'package:taski/presentation/pages/sign_up/cubit/sign_up_page_cubit.dart'
    as _i20;
import 'package:taski/presentation/pages/task_page/cubit/task_page_cubit.dart'
    as _i21;
import 'package:taski/presentation/pages/tasks_month/cubit/tasks_month_page_cubit.dart'
    as _i22;
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart'
    as _i23;
import 'package:taski/presentation/pages/user_search_page/cubit/user_search_page_cubit.dart'
    as _i24;
import 'package:taski/presentation/pages/week_tasks/cubit/week_tasks_page_cubit.dart'
    as _i25;

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
    gh.singleton<_i3.FirebaseAuth>(appModule.firebaseAuth());
    gh.singleton<_i4.FirebaseFirestore>(appModule.fireStore());
    gh.singleton<_i5.TaskRepository>(
        _i6.TaskDataSource(gh<_i4.FirebaseFirestore>()));
    gh.singleton<_i7.AuthRepository>(_i8.AuthDataSource(
      gh<_i3.FirebaseAuth>(),
      gh<_i4.FirebaseFirestore>(),
    ));
    gh.factory<_i9.CategoryPageCubit>(
        () => _i9.CategoryPageCubit(gh<_i5.TaskRepository>()));
    gh.singleton<_i10.CategoryRepository>(_i11.CategoriesDataSource(
      gh<_i4.FirebaseFirestore>(),
      gh<_i3.FirebaseAuth>(),
    ));
    gh.factory<_i12.CreateCategoryPageCubit>(() => _i12.CreateCategoryPageCubit(
          gh<_i10.CategoryRepository>(),
          gh<_i7.AuthRepository>(),
          gh<_i5.TaskRepository>(),
        ));
    gh.factory<_i13.CreateTaskCubit>(() => _i13.CreateTaskCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
          gh<_i10.CategoryRepository>(),
        ));
    gh.factory<_i14.ExamplePageCubit>(() => _i14.ExamplePageCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
        ));
    gh.factory<_i15.FriendsPageCubit>(
        () => _i15.FriendsPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i16.HomePageCubit>(
        () => _i16.HomePageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i17.ProfilePageCubit>(
        () => _i17.ProfilePageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i18.SendResetLinkPageCubit>(
        () => _i18.SendResetLinkPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i19.SignInPageCubit>(
        () => _i19.SignInPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i20.SignUpPageCubit>(
        () => _i20.SignUpPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i21.TaskPageCubit>(
        () => _i21.TaskPageCubit(gh<_i10.CategoryRepository>()));
    gh.factory<_i22.TasksMonthPageCubit>(() => _i22.TasksMonthPageCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
        ));
    gh.factory<_i23.TasksSingleDayPageCubit>(() => _i23.TasksSingleDayPageCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
        ));
    gh.factory<_i24.UserSearchPageCubit>(
        () => _i24.UserSearchPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i25.WeekTasksPageCubit>(() => _i25.WeekTasksPageCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
        ));
    gh.factory<_i26.CategoriesPageCubit>(
        () => _i26.CategoriesPageCubit(gh<_i10.CategoryRepository>()));
    return this;
  }
}

class _$AppModule extends _i27.AppModule {}
