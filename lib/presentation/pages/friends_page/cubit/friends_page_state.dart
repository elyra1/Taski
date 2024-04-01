part of 'friends_page_cubit.dart';

@freezed
class FriendsPageState with _$FriendsPageState {
  const factory FriendsPageState.loaded(
      {required List<UserModel> friendsList}) = _Loaded;
  const factory FriendsPageState.loading() = _Loading;
}
