import 'package:taski/domain/entities/user_model.dart';

abstract class AuthRepository {
  Future<void> signIn({required String email, required String password});
  Future<void> signUp({
    required String username,
    required String email,
    required String password,
  });
  Future<UserModel> getCurrentUser();
  Future<void> resetPassword({required String email});
}
