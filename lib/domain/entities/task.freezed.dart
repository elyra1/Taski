// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'task.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Task _$TaskFromJson(Map<String, dynamic> json) {
  return _TaskEntity.fromJson(json);
}

/// @nodoc
mixin _$Task {
  String get title => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get startTime => throw _privateConstructorUsedError;
  @TimestampConverter()
  Timestamp get endTime => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  bool get isNotificationSended => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TaskCopyWith<Task> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCopyWith<$Res> {
  factory $TaskCopyWith(Task value, $Res Function(Task) then) =
      _$TaskCopyWithImpl<$Res, Task>;
  @useResult
  $Res call(
      {String title,
      String? description,
      String id,
      String authorId,
      @TimestampConverter() Timestamp startTime,
      @TimestampConverter() Timestamp endTime,
      int color,
      String? category,
      bool isNotificationSended});
}

/// @nodoc
class _$TaskCopyWithImpl<$Res, $Val extends Task>
    implements $TaskCopyWith<$Res> {
  _$TaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? id = null,
    Object? authorId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? color = null,
    Object? category = freezed,
    Object? isNotificationSended = null,
  }) {
    return _then(_value.copyWith(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isNotificationSended: null == isNotificationSended
          ? _value.isNotificationSended
          : isNotificationSended // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TaskEntityImplCopyWith<$Res> implements $TaskCopyWith<$Res> {
  factory _$$TaskEntityImplCopyWith(
          _$TaskEntityImpl value, $Res Function(_$TaskEntityImpl) then) =
      __$$TaskEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String title,
      String? description,
      String id,
      String authorId,
      @TimestampConverter() Timestamp startTime,
      @TimestampConverter() Timestamp endTime,
      int color,
      String? category,
      bool isNotificationSended});
}

/// @nodoc
class __$$TaskEntityImplCopyWithImpl<$Res>
    extends _$TaskCopyWithImpl<$Res, _$TaskEntityImpl>
    implements _$$TaskEntityImplCopyWith<$Res> {
  __$$TaskEntityImplCopyWithImpl(
      _$TaskEntityImpl _value, $Res Function(_$TaskEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = freezed,
    Object? id = null,
    Object? authorId = null,
    Object? startTime = null,
    Object? endTime = null,
    Object? color = null,
    Object? category = freezed,
    Object? isNotificationSended = null,
  }) {
    return _then(_$TaskEntityImpl(
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      startTime: null == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      endTime: null == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as Timestamp,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      isNotificationSended: null == isNotificationSended
          ? _value.isNotificationSended
          : isNotificationSended // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TaskEntityImpl implements _TaskEntity {
  const _$TaskEntityImpl(
      {required this.title,
      this.description = '',
      required this.id,
      required this.authorId,
      @TimestampConverter() required this.startTime,
      @TimestampConverter() required this.endTime,
      required this.color,
      this.category = '',
      this.isNotificationSended = false});

  factory _$TaskEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$TaskEntityImplFromJson(json);

  @override
  final String title;
  @override
  @JsonKey()
  final String? description;
  @override
  final String id;
  @override
  final String authorId;
  @override
  @TimestampConverter()
  final Timestamp startTime;
  @override
  @TimestampConverter()
  final Timestamp endTime;
  @override
  final int color;
  @override
  @JsonKey()
  final String? category;
  @override
  @JsonKey()
  final bool isNotificationSended;

  @override
  String toString() {
    return 'Task(title: $title, description: $description, id: $id, authorId: $authorId, startTime: $startTime, endTime: $endTime, color: $color, category: $category, isNotificationSended: $isNotificationSended)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TaskEntityImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.isNotificationSended, isNotificationSended) ||
                other.isNotificationSended == isNotificationSended));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, title, description, id, authorId,
      startTime, endTime, color, category, isNotificationSended);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TaskEntityImplCopyWith<_$TaskEntityImpl> get copyWith =>
      __$$TaskEntityImplCopyWithImpl<_$TaskEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TaskEntityImplToJson(
      this,
    );
  }
}

abstract class _TaskEntity implements Task {
  const factory _TaskEntity(
      {required final String title,
      final String? description,
      required final String id,
      required final String authorId,
      @TimestampConverter() required final Timestamp startTime,
      @TimestampConverter() required final Timestamp endTime,
      required final int color,
      final String? category,
      final bool isNotificationSended}) = _$TaskEntityImpl;

  factory _TaskEntity.fromJson(Map<String, dynamic> json) =
      _$TaskEntityImpl.fromJson;

  @override
  String get title;
  @override
  String? get description;
  @override
  String get id;
  @override
  String get authorId;
  @override
  @TimestampConverter()
  Timestamp get startTime;
  @override
  @TimestampConverter()
  Timestamp get endTime;
  @override
  int get color;
  @override
  String? get category;
  @override
  bool get isNotificationSended;
  @override
  @JsonKey(ignore: true)
  _$$TaskEntityImplCopyWith<_$TaskEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
