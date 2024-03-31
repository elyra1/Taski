part of 'profile_page_cubit.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState.loading() = _Loading;
  const factory ProfilePageState.loaded({required UserModel user}) = _Loaded;
}
