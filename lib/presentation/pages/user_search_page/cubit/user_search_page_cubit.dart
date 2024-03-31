import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/entities/user_model.dart';
import 'package:taski/domain/repositories/auth_repository.dart';

part 'user_search_page_state.dart';
part 'user_search_page_cubit.freezed.dart';

@injectable
class UserSearchPageCubit extends Cubit<UserSearchPageState> {
  final AuthRepository _authRepository;
  UserSearchPageCubit(this._authRepository)
      : super(const UserSearchPageState.initial());

  Stream<Iterable<UserModel>> getSearchUsersStream() async* {
    final current = await _authRepository.getUser();
    yield* _authRepository
        .getUsersStream()
        .map((event) => event.where((element) => element.id != current.id));
  }
}
