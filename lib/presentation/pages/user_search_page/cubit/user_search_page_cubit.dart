import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'user_search_page_state.dart';
part 'user_search_page_cubit.freezed.dart';

@injectable
class UserSearchPageCubit extends Cubit<UserSearchPageState> {
  final UserRepository _authRepository;
  UserSearchPageCubit(this._authRepository)
      : super(const UserSearchPageState.initial());

  Stream<Iterable<UserModel>> getSearchUsersStream() async* {
    final current = await _authRepository.getUser();
    yield* _authRepository
        .getUsersStream()
        .map((event) => event.where((element) => element.id != current.id));
  }

  Stream<(UserModel, Iterable<UserModel>)> getDataStream() async* {
    final currentUserStream = _authRepository.getCurrentUserStream();
    final usersStream = currentUserStream.switchMap(
      (currentUser) => _authRepository.getUsersStream().map(
            (event) => event.where((element) => element.id != currentUser.id),
          ),
    );
    final combinedStream = Rx.combineLatest2(
      currentUserStream,
      usersStream,
      (currentUser, users) => (currentUser, users),
    );
    yield* combinedStream;
  }

  Future<void> sendFriendRequest({required String userId}) async {
    await _authRepository.sendFriendRequest(userId: userId);
  }

  Future<void> deleteFromFriends({required String userId}) async {
    await _authRepository.deleteFromFriends(userId: userId);
  }

  Future<void> acceptFriendRequest({required String userId}) async {
    await _authRepository.acceptFriendRequest(userId: userId);
  }

  Future<void> declineFriendRequest({required String userId}) async {
    await _authRepository.declineFriendRequest(userId: userId);
  }

  Future<void> undoRequest({required String userId}) async {
    await _authRepository.undoFriendRequest(userId: userId);
  }
}
