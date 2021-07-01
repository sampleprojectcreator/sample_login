import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:login_bloc/blocs/bloc/login_bloc.dart';
import 'package:login_bloc/screens/home_screen.dart';
import 'package:login_bloc/screens/login_screen.dart';

void main() {
  runApp(const LoginSample());
}

class LoginSample extends StatelessWidget {
  const LoginSample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => AuthenticationBloc(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
      bloc: BlocProvider.of<AuthenticationBloc>(context)..add(AppStarted()),
      builder: (BuildContext context, AuthenticationState state) {
        if (state is UnauthenticatedState) {
          return BlocProvider(
            create: (context) => LoginBloc(),
            child: const LoginScreen(),
          );
        } else if (state is AuthenticationState) {
          return const HomeScreen();
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
