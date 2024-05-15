import 'dart:developer';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/photo_repository.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'edit_profile_page_state.dart';
part 'edit_profile_page_cubit.freezed.dart';

@injectable
class EditProfilePageCubit extends Cubit<EditProfilePageState> {
  final UserRepository _userRepository;
  final PhotoRepository _photoRepository;
  EditProfilePageCubit(this._userRepository, this._photoRepository)
      : super(const EditProfilePageState.loading());

  void init(UserModel user) {
    emit(EditProfilePageState.loaded(user: user));
  }

  Future<void> editProfile(
      {File? photo, String? username, required UserModel initialUser}) async {
    final loaded = (state as Loaded);
    emit(const EditProfilePageState.saving());
    String? url;
    if (photo != null) {
      final file = File(photo.path);
      url = await _photoRepository.setUserPhoto(file);
    }
    await _userRepository.editProfile(
      user: loaded.user.copyWith(
        photoUrl: url ?? loaded.user.photoUrl,
        username: username ?? loaded.user.username,
      ),
    );
    if (loaded.user.photoUrl == null && initialUser.photoUrl != null) {
      final regex = RegExp(r'user_photos%2F(.+?)\?');
      final match = regex.firstMatch(initialUser.photoUrl!);
      if (match != null) {
        final uuid = match.group(1);
        if (uuid != null) _photoRepository.removePhoto(uuid);
      }
    }
  }

  Future<void> pickImage() async {
    final imagePicker = ImagePicker();
    final photo = await imagePicker.pickImage(source: ImageSource.gallery);
    if (photo?.path != null) {
      final file = File(photo!.path);
      emit((state as Loaded).copyWith(newPhoto: file));
    }
  }

  Future<void> deleteImage() async {
    final loaded = (state as Loaded);
    emit(
      loaded.copyWith(
        newPhoto: null,
        user: loaded.user.copyWith(photoUrl: null),
      ),
    );
  }
}
