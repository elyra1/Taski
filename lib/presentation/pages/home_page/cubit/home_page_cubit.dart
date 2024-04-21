import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:taski/domain/repositories/user_repository.dart';

part 'home_page_state.dart';
part 'home_page_cubit.freezed.dart';

@injectable
class HomePageCubit extends Cubit<HomePageState> {
  final UserRepository _authRepository;
  HomePageCubit(this._authRepository) : super(const HomePageState.initial());
  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
