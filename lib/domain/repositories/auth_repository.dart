import 'package:taski/domain/entities/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signIn({required String email, required String password});
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });
  Future<UserModel> getUser({String? userId});
  Future<void> resetPassword({required String email});
  bool get isUserAuthorizedWithEmail;
  Future<void> signOut();
  Future<List<UserModel>> getUserFriends();
  Stream<Iterable<UserModel>> getUsersStream();
}
