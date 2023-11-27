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
import 'package:taski/data/datasources/auth_data_source.dart' as _i9;
import 'package:taski/data/datasources/tasks_data_sourse.dart' as _i7;
import 'package:taski/di/app_module.dart' as _i12;
import 'package:taski/domain/repositories/auth_repository.dart' as _i8;
import 'package:taski/domain/repositories/task_repository.dart' as _i6;
import 'package:taski/presentation/pages/create_task/cubit/create_task_page_cubit.dart'
    as _i10;
import 'package:taski/presentation/pages/example_page/cubit/example_page_cubit.dart'
    as _i11;
import 'package:taski/presentation/pages/send_reset_link/cubit/send_reset_link_page_cubit.dart'
    as _i5;

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
    gh.factory<_i5.SendResetLinkPageCubit>(() => _i5.SendResetLinkPageCubit());
    gh.singleton<_i6.TaskRepository>(
        _i7.TaskDataSource(gh<_i4.FirebaseFirestore>()));
    gh.singleton<_i8.AuthRepository>(_i9.AuthDataSource(
      gh<_i3.FirebaseAuth>(),
      gh<_i4.FirebaseFirestore>(),
    ));
    gh.factory<_i10.CreateTaskCubit>(() => _i10.CreateTaskCubit(
          gh<_i6.TaskRepository>(),
          gh<_i8.AuthRepository>(),
        ));
    gh.factory<_i11.ExamplePageCubit>(() => _i11.ExamplePageCubit(
          gh<_i6.TaskRepository>(),
          gh<_i8.AuthRepository>(),
        ));
    return this;
  }
}

class _$AppModule extends _i12.AppModule {}
