// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      username: json['username'] as String,
      email: json['email'] as String,
      id: json['id'] as String,
      photoUrl: json['photoUrl'] as String? ?? null,
      friendsIds: (json['friendsIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'username': instance.username,
      'email': instance.email,
      'id': instance.id,
      'photoUrl': instance.photoUrl,
      'friendsIds': instance.friendsIds,
    };
