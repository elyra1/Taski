import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final UserRepository _userRepository;
  HomePageCubit(this._userRepository)
      : super(HomePageState.initial(user: UserModel.getEmpty()));

  Future<void> init({UserModel? user}) async {
    if (user != null) {
      emit(state.copyWith(user: user));
    } else {
      final currentUser = await _userRepository.getUser();
      emit(state.copyWith(user: currentUser));
    }
  }
}
