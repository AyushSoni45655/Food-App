import 'package:bloc/bloc.dart';
import 'package:food_application/feture/domain/use_case/login_usecase.dart';
import 'package:meta/meta.dart';

import '../../../domain/entity/user.dart';
import '../../../domain/use_case/forgotpassword_usecase.dart';
import '../../../domain/use_case/logout_usecase.dart';
import '../../../domain/use_case/signup_usecase.dart';
import '../../../domain/use_case/user_loggesin_usecase.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserLoggedInUseCase loggedInUseCase;
  final SignInUseCase signInUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final LoginUseCae loginUseCase;
  final LogOutUseCase logOutUseCase;
  AuthenticationBloc({
    required this.loggedInUseCase,
    required this.forgotPasswordUseCase,
    required this.loginUseCase,
    required this.logOutUseCase,
    required this.signInUseCase,
  }) : super(AuthenticationInitial()) {
    on<SigninEvent>((event, emit)async{
      emit(AuthLoading());
      final signin =   await signInUseCase(event.userEntity);
      signin.fold((l) => emit(AuthFailure(l.error.toString())), (r) => emit(AuthSuccess(r)),);
    });
    on<ForgotPasswordEvent>((event, emit) async{
      emit(AuthLoading());
      final fPass = await forgotPasswordUseCase(event.email);
      fPass.fold((l) => emit(AuthFailure(l.error.toString())), (_) => emit(AuthLoggedOut()),);
    },);
    on<loginEvent>((event, emit)async{
      emit(AuthLoading());
      final login =   await loginUseCase(event.email,event.password);
      login.fold((l) => emit(AuthFailure(l.error.toString())), (r) => emit(AuthSuccess(r)),);
    });
    on<logoutEvent>((event, emit)async{
      emit(AuthLoading());
      final logout =   await logOutUseCase();
      logout.fold((l) => emit(AuthFailure(l.error.toString())), (_) => emit(AuthLoggedOut()),);
    });
    on<isLoggedInEvent>((event, emit)async{
      emit(AuthLoading());
      final isloggedIn =   await loggedInUseCase();
      isloggedIn.fold((l) => emit(AuthLoggedOut()), (r) => r?emit(AuthLoggedIn()):emit(AuthLoggedOut()),);
    });
  }
}
