import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/repositories/auth_repository.dart';

part 'send_reset_link_page_state.dart';
part 'send_reset_link_page_cubit.freezed.dart';

@injectable
class SendResetLinkPageCubit extends Cubit<SendResetLinkPageState> {
  final AuthRepository _authRepository;
  SendResetLinkPageCubit(this._authRepository)
      : super(SendResetLinkPageState.initial());

  Future<String?> sendResetLink({required String email}) async {
    try {
      await _authRepository.resetPassword(email: email);
      return null;
    } on FirebaseAuthException catch (e, _) {
      return e.message;
    }
  }
}
