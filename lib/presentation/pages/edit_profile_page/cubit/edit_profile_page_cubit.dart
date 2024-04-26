import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'edit_profile_page_state.dart';
part 'edit_profile_page_cubit.freezed.dart';

@injectable
class EditProfilePageCubit extends Cubit<EditProfilePageState> {
  final UserRepository _userRepository;
  EditProfilePageCubit(this._userRepository)
      : super(const EditProfilePageState.initial());

  Future<void> editProfile({required UserModel user}) async {
    _userRepository.editProfile(user: user);
  }
}
