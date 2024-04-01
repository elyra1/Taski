import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/auth_repository.dart';

part 'friends_page_state.dart';
part 'friends_page_cubit.freezed.dart';

@injectable
class FriendsPageCubit extends Cubit<FriendsPageState> {
  final AuthRepository _authRepository;
  FriendsPageCubit(this._authRepository)
      : super(const FriendsPageState.loading());

  Future<void> loadFriends() async {
    final friends = await _authRepository.getUserFriends();
    await Future.delayed(const Duration(milliseconds: 500));
    emit(FriendsPageState.loaded(friendsList: friends));
  }
}
