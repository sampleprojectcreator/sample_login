part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccess extends LoginState {
  final String token;

  const LoginSuccess(this.token);

  @override
  List<Object> get props => [token];
}

class LoginFailed extends LoginState {
  final String email;
  final String password;

  const LoginFailed(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}
