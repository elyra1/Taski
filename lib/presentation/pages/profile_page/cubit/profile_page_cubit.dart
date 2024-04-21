import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'profile_page_state.dart';
part 'profile_page_cubit.freezed.dart';

@injectable
class ProfilePageCubit extends Cubit<ProfilePageState> {
  final UserRepository _authRepository;
  ProfilePageCubit(this._authRepository)
      : super(const ProfilePageState.loading());

  Future<void> init() async {
    final user = await _authRepository.getUser();
    await Future.delayed(const Duration(milliseconds: 500));
    emit(ProfilePageState.loaded(user: user));
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
