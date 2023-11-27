import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_in_page_state.dart';
part 'sign_in_page_cubit.freezed.dart';

class SignInPageCubit extends Cubit<SignInPageState> {
  SignInPageCubit() : super(SignInPageState.initial());
}
