import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'send_reset_link_page_state.dart';
part 'send_reset_link_page_cubit.freezed.dart';

@injectable
class SendResetLinkPageCubit extends Cubit<SendResetLinkPageState> {
  SendResetLinkPageCubit() : super(SendResetLinkPageState.initial());
}
