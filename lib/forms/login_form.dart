import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/blocs/bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key key}) : super(key: key);
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _usernameInput(),
          _passwordInput(),
          _loginButton(),
        ],
      ),
    );
  }

  Widget _usernameInput() {
    return TextField(
      controller: _emailController,
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
      ),
    );
  }

  Widget _passwordInput() {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
      ),
    );
  }

  Widget _loginButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: ElevatedButton(
        onPressed: () => BlocProvider.of<LoginBloc>(context).add(
          LoginButtonPressedEvent(
            _emailController.text,
            _passwordController.text,
          ),
        ),
        child: const Text("Login"),
      ),
    );
  }
}
