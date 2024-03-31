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
import 'package:taski/di/app_module.dart' as _i21;
import 'package:taski/domain/repositories/auth_repository.dart' as _i7;
import 'package:taski/domain/repositories/category_repository.dart' as _i10;
import 'package:taski/domain/repositories/task_repository.dart' as _i5;
import 'package:taski/presentation/pages/categories_page/cubit/categories_page_cubit.dart'
    as _i20;
import 'package:taski/presentation/pages/category_page/cubit/category_page_cubit.dart'
    as _i9;
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart'
    as _i12;
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart'
    as _i13;
import 'package:taski/presentation/pages/friends_page/cubit/friends_page_cubit.dart'
    as _i14;
import 'package:taski/presentation/pages/home_page/cubit/home_page_cubit.dart'
    as _i15;
import 'package:taski/presentation/pages/send_reset_link/cubit/send_reset_link_page_cubit.dart'
    as _i16;
import 'package:taski/presentation/pages/sign_in/cubit/sign_in_page_cubit.dart'
    as _i17;
import 'package:taski/presentation/pages/sign_up/cubit/sign_up_page_cubit.dart'
    as _i18;
import 'package:taski/presentation/pages/tasks_single_day/cubit/tasks_single_day_page_cubit.dart'
    as _i19;

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
    gh.factory<_i12.CreateTaskCubit>(() => _i12.CreateTaskCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
        ));
    gh.factory<_i13.ExamplePageCubit>(() => _i13.ExamplePageCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
        ));
    gh.factory<_i14.FriendsPageCubit>(
        () => _i14.FriendsPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i15.HomePageCubit>(
        () => _i15.HomePageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i16.SendResetLinkPageCubit>(
        () => _i16.SendResetLinkPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i17.SignInPageCubit>(
        () => _i17.SignInPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i18.SignUpPageCubit>(
        () => _i18.SignUpPageCubit(gh<_i7.AuthRepository>()));
    gh.factory<_i19.TasksSingleDayPageCubit>(() => _i19.TasksSingleDayPageCubit(
          gh<_i5.TaskRepository>(),
          gh<_i7.AuthRepository>(),
        ));
    gh.factory<_i20.CategoriesPageCubit>(
        () => _i20.CategoriesPageCubit(gh<_i10.CategoryRepository>()));
    return this;
  }
}

class _$AppModule extends _i21.AppModule {}
