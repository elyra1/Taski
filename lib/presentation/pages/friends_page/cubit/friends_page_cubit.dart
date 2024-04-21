import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'friends_page_state.dart';
part 'friends_page_cubit.freezed.dart';

@injectable
class FriendsPageCubit extends Cubit<FriendsPageState> {
  final UserRepository _authRepository;
  FriendsPageCubit(this._authRepository)
      : super(const FriendsPageState.initial());

  Stream<(UserModel, Iterable<UserModel>)> getDataStream() async* {
    final currentUserStream = _authRepository.getCurrentUserStream();
    final friendsStream = currentUserStream.switchMap(
      (currentUser) => _authRepository.getUsersStream().map(
            (users) => users.where(
              (user) =>
                  currentUser.friendsIds.contains(user.id) ||
                  currentUser.requests.contains(user.id),
            ),
          ),
    );
    final combinedStream = Rx.combineLatest2(
      currentUserStream,
      friendsStream,
      (UserModel currentUser, Iterable<UserModel> friends) {
        return (currentUser, friends);
      },
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
