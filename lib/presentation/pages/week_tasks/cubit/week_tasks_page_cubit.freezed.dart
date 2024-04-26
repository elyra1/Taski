// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'week_tasks_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WeekTasksPageState {
  List<Task> get tasks => throw _privateConstructorUsedError;
  UserModel get currentUser => throw _privateConstructorUsedError;
  DateTime get selectedWeek => throw _privateConstructorUsedError;
  int get page => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> tasks, UserModel currentUser,
            DateTime selectedWeek, int page)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Task> tasks, UserModel currentUser,
            DateTime selectedWeek, int page)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> tasks, UserModel currentUser,
            DateTime selectedWeek, int page)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WeekTasksPageStateCopyWith<WeekTasksPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WeekTasksPageStateCopyWith<$Res> {
  factory $WeekTasksPageStateCopyWith(
          WeekTasksPageState value, $Res Function(WeekTasksPageState) then) =
      _$WeekTasksPageStateCopyWithImpl<$Res, WeekTasksPageState>;
  @useResult
  $Res call(
      {List<Task> tasks,
      UserModel currentUser,
      DateTime selectedWeek,
      int page});

  $UserModelCopyWith<$Res> get currentUser;
}

/// @nodoc
class _$WeekTasksPageStateCopyWithImpl<$Res, $Val extends WeekTasksPageState>
    implements $WeekTasksPageStateCopyWith<$Res> {
  _$WeekTasksPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? currentUser = null,
    Object? selectedWeek = null,
    Object? page = null,
  }) {
    return _then(_value.copyWith(
      tasks: null == tasks
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
      selectedWeek: null == selectedWeek
          ? _value.selectedWeek
          : selectedWeek // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get currentUser {
    return $UserModelCopyWith<$Res>(_value.currentUser, (value) {
      return _then(_value.copyWith(currentUser: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $WeekTasksPageStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<Task> tasks,
      UserModel currentUser,
      DateTime selectedWeek,
      int page});

  @override
  $UserModelCopyWith<$Res> get currentUser;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$WeekTasksPageStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tasks = null,
    Object? currentUser = null,
    Object? selectedWeek = null,
    Object? page = null,
  }) {
    return _then(_$InitialImpl(
      tasks: null == tasks
          ? _value._tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
      currentUser: null == currentUser
          ? _value.currentUser
          : currentUser // ignore: cast_nullable_to_non_nullable
              as UserModel,
      selectedWeek: null == selectedWeek
          ? _value.selectedWeek
          : selectedWeek // ignore: cast_nullable_to_non_nullable
              as DateTime,
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {required final List<Task> tasks,
      required this.currentUser,
      required this.selectedWeek,
      required this.page})
      : _tasks = tasks;

  final List<Task> _tasks;
  @override
  List<Task> get tasks {
    if (_tasks is EqualUnmodifiableListView) return _tasks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tasks);
  }

  @override
  final UserModel currentUser;
  @override
  final DateTime selectedWeek;
  @override
  final int page;

  @override
  String toString() {
    return 'WeekTasksPageState.initial(tasks: $tasks, currentUser: $currentUser, selectedWeek: $selectedWeek, page: $page)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            const DeepCollectionEquality().equals(other._tasks, _tasks) &&
            (identical(other.currentUser, currentUser) ||
                other.currentUser == currentUser) &&
            (identical(other.selectedWeek, selectedWeek) ||
                other.selectedWeek == selectedWeek) &&
            (identical(other.page, page) || other.page == page));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_tasks),
      currentUser,
      selectedWeek,
      page);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(List<Task> tasks, UserModel currentUser,
            DateTime selectedWeek, int page)
        initial,
  }) {
    return initial(tasks, currentUser, selectedWeek, page);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(List<Task> tasks, UserModel currentUser,
            DateTime selectedWeek, int page)?
        initial,
  }) {
    return initial?.call(tasks, currentUser, selectedWeek, page);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(List<Task> tasks, UserModel currentUser,
            DateTime selectedWeek, int page)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(tasks, currentUser, selectedWeek, page);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements WeekTasksPageState {
  const factory _Initial(
      {required final List<Task> tasks,
      required final UserModel currentUser,
      required final DateTime selectedWeek,
      required final int page}) = _$InitialImpl;

  @override
  List<Task> get tasks;
  @override
  UserModel get currentUser;
  @override
  DateTime get selectedWeek;
  @override
  int get page;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
