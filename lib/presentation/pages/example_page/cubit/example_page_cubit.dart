import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'example_page_cubit.freezed.dart';

part 'example_page_state.dart';

class ExamplePageCubit extends Cubit<ExamplePage> {
  ExamplePageCubit() : super(const ExamplePage.initial());
}
