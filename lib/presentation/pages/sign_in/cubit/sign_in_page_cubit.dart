import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'sign_in_page_state.dart';
part 'sign_in_page_cubit.freezed.dart';

@injectable
class SignInPageCubit extends Cubit<SignInPageState> {
  final UserRepository _authRepository;
  SignInPageCubit(this._authRepository) : super(SignInPageState.initial());

  Future<String?> signIn(
      {required String email, required String password}) async {
    try {
      await _authRepository.signIn(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e, _) {
      return e.message;
    }
  }
}
