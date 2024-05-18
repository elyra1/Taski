part of 'edit_profile_page_cubit.dart';

@freezed
class EditProfilePageState with _$EditProfilePageState {
  const factory EditProfilePageState.loading() = Loading;
  const factory EditProfilePageState.loaded(
      {required UserModel user, File? newPhoto}) = Loaded;
  const factory EditProfilePageState.saving() = Saving;
}
