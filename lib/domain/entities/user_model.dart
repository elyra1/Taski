import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required String username,
    required String email,
    required String id,
    @Default(null) String? photoUrl,
    @Default([]) List<String> friendsIds,
    @Default([]) List<String> requests,
  }) = _UserEntity;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  static UserModel getEmpty() =>
      const UserModel(email: 'email', username: 'username', id: 'id');
}
