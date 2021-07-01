part of 'authentication_bloc.dart';

abstract class AuthenticationState extends Equatable {
  const AuthenticationState();

  @override
  List<Object> get props => [];
}

class UnauthenticatedState extends AuthenticationState {}

class AuthenticatedState extends AuthenticationState {}

class AuthenticationUnknownState extends AuthenticationState {}
