import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_page_state.dart';
part 'sign_up_page_cubit.freezed.dart';

class SignUpPageCubit extends Cubit<SignUpPageState> {
  SignUpPageCubit() : super(SignUpPageState.initial());
}
