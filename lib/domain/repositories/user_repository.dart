import 'package:taski/domain/entities/user_model.dart';

abstract class UserRepository {
  Future<UserModel> signIn({required String email, required String password});
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });
  Future<UserModel> getUser({String? userId});
  Stream<UserModel> getCurrentUserStream();
  Future<void> resetPassword({required String email});
  bool get isUserAuthorizedWithEmail;
  Future<void> signOut();
  Future<List<UserModel>> getUserFriends();
  Stream<Iterable<UserModel>> getUsersStream();
  Future<void> sendFriendRequest({required String userId});
  Future<void> deleteFromFriends({required String userId});
  Future<void> acceptFriendRequest({required String userId});
  Future<void> declineFriendRequest({required String userId});
  Future<void> undoFriendRequest({required String userId});
}
