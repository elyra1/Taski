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
      category: json['category'] as String? ?? null,
      notificationSended: json['notificationSended'] as bool? ?? false,
      remindTimeInSeconds: json['remindTimeInSeconds'] as int? ?? 900,
      repeatString: json['repeatString'] as String? ?? "never",
      contributors: (json['contributors'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
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
      'notificationSended': instance.notificationSended,
      'remindTimeInSeconds': instance.remindTimeInSeconds,
      'repeatString': instance.repeatString,
      'contributors': instance.contributors,
    };
