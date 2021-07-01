part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}

class AuthenticationStatusChanged extends AuthenticationEvent {
  final AuthenticationStatus authenticationStatus;
  final String token;
  const AuthenticationStatusChanged(this.authenticationStatus, {this.token});

  @override
  List<Object> get props => [authenticationStatus, token];
}

class AppStarted extends AuthenticationEvent {}
