import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required String email,
    required String name,
    required String photoUrl,
    required String id,
    @Default([]) List<String> friendsIds,
  }) = _UserEntity;

  static User getEmpty() =>
      const User(email: 'email', name: 'name', photoUrl: 'photoUrl', id: 'id');
}
