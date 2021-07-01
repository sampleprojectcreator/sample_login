import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:login_bloc/models/authentication_status.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc() : super(AuthenticationUnknownState());

  final FlutterSecureStorage secureStorage = const FlutterSecureStorage();

  @override
  Stream<AuthenticationState> mapEventToState(
      AuthenticationEvent event) async* {
    if (event is AppStarted) {
      yield* _mapAppStartedEventToState(event);
    } else if (event is AuthenticationStatusChanged) {
      yield* _mapAuthenticationStatusChangedEventToState(event);
    }
  }

  Stream<AuthenticationState> _mapAppStartedEventToState(
      AppStarted event) async* {
    final hasToken = await secureStorage.containsKey(key: "token");
    if (hasToken) {
      yield AuthenticatedState();
    } else {
      yield UnauthenticatedState();
    }
  }

  Stream<AuthenticationState> _mapAuthenticationStatusChangedEventToState(
      AuthenticationStatusChanged event) async* {
    switch (event.authenticationStatus) {
      case AuthenticationStatus.loggedIn:
        await secureStorage.write(key: "token", value: event.token);
        yield AuthenticatedState();
        return;
      case AuthenticationStatus.loggedOut:
        await secureStorage.delete(key: "token");
        yield UnauthenticatedState();
        return;
      default:
        yield AuthenticationUnknownState();
    }
  }
}
