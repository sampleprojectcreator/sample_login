import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_bloc/repositories/login_repository.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial());

  LoginRepository loginRepository = LoginRepository();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressedEvent) {
      yield* _mapLoginButtonPressedEventToState(event);
    }
  }

  Stream<LoginState> _mapLoginButtonPressedEventToState(
      LoginButtonPressedEvent event) async* {
    String token =
        await loginRepository.loginButtonPressed(event.email, event.password);
    if (token == null) {
      yield LoginFailed(event.email, event.password);
    } else {
      yield LoginSuccess(token);
    }
  }
}
