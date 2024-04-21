import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'sign_up_page_state.dart';
part 'sign_up_page_cubit.freezed.dart';

@injectable
class SignUpPageCubit extends Cubit<SignUpPageState> {
  final UserRepository _authRepository;
  SignUpPageCubit(this._authRepository)
      : super(const SignUpPageState.initial());

  Future<String?> signUp(
      {required String username,
      required String email,
      required String password}) async {
    try {
      await _authRepository.signUp(
        username: username,
        email: email,
        password: password,
      );
      return null;
    } on FirebaseAuthException catch (e, _) {
      return e.message;
    }
  }
}
