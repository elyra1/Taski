// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryEntityImpl _$$CategoryEntityImplFromJson(Map<String, dynamic> json) =>
    _$CategoryEntityImpl(
      title: json['title'] as String,
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      color: json['color'] as int,
      tasks:
          (json['tasks'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              const [],
    );

Map<String, dynamic> _$$CategoryEntityImplToJson(
        _$CategoryEntityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'id': instance.id,
      'authorId': instance.authorId,
      'color': instance.color,
      'tasks': instance.tasks,
    };
