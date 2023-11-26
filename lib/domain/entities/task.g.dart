// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TaskEntityImpl _$$TaskEntityImplFromJson(Map<String, dynamic> json) =>
    _$TaskEntityImpl(
      title: json['title'] as String,
      description: json['description'] as String? ?? '',
      id: json['id'] as String,
      authorId: json['authorId'] as String,
      startTime: const TimestampConverter().fromJson(json['startTime']),
      endTime: const TimestampConverter().fromJson(json['endTime']),
      color: json['color'] as int,
      category: json['category'] as String? ?? '',
    );

Map<String, dynamic> _$$TaskEntityImplToJson(_$TaskEntityImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'id': instance.id,
      'authorId': instance.authorId,
      'startTime': const TimestampConverter().toJson(instance.startTime),
      'endTime': const TimestampConverter().toJson(instance.endTime),
      'color': instance.color,
      'category': instance.category,
    };
