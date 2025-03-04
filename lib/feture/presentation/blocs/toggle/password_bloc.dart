import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'password_event.dart';
part 'password_state.dart';

class PasswordBloc extends Bloc<PasswordEvent, PasswordToggleState> {
  PasswordBloc() : super(PasswordToggleState(obscure: true)) {
    on<PasswordToggleEvent>((event, emit) {
      emit(PasswordToggleState(obscure: !state.obscure));
    });
  }
}
