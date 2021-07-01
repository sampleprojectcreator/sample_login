import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_bloc/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:login_bloc/models/authentication_status.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Home Screen"),
            ElevatedButton(
              onPressed: () {
                BlocProvider.of<AuthenticationBloc>(context).add(
                    const AuthenticationStatusChanged(
                        AuthenticationStatus.loggedOut));
              },
              child: const Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
