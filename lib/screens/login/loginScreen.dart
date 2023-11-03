import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tenders_lk_app/bloc/authentication/auth_bloc.dart';
import 'package:tenders_lk_app/bloc/loginBloc/login_bloc_bloc.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';
import 'package:tenders_lk_app/screens/login/loginForm.dart';

class LoginScreen extends StatelessWidget {
  final UserRepositories userRepositories;
  const LoginScreen({super.key, required this.userRepositories});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
              userRepositories: userRepositories,
              authBloc: BlocProvider.of<AuthBloc>(context));
        },
        child: LoginForm(
          userRepositories: userRepositories,
        ),
      ),
    );
  }
}
