import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:login_bloc/blocs/bloc/login_bloc.dart';
import 'package:login_bloc/forms/login_form.dart';
import 'package:login_bloc/models/authentication_status.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      bloc: BlocProvider.of<LoginBloc>(context),
      listener: (BuildContext context, LoginState state) {
        if (state is LoginSuccess) {
          BlocProvider.of<AuthenticationBloc>(context).add(
            AuthenticationStatusChanged(
              AuthenticationStatus.loggedIn,
              token: state.token,
            ),
          );
        } else if (state is LoginFailed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Login Failed!'),
            ),
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Login Screen"),
        ),
        body: const LoginForm(),
      ),
    );
  }
}
