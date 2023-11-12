import 'package:freezed_annotation/freezed_annotation.dart';

part "user_entity.freezed.dart";

@freezed
class UserEntity with _$UserEntity {
  const factory UserEntity({
    required String email,
    required String name,
    required String photoUrl,
    required String id,
    @Default([]) List<String> friendsIds,
  }) = _UserEntity;

  static UserEntity getEmpty() => const UserEntity(
      email: 'email', name: 'name', photoUrl: 'photoUrl', id: 'id');
}
