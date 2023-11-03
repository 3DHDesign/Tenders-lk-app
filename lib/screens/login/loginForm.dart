import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenders_lk_app/bloc/loginBloc/login_bloc_bloc.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';
import 'package:tenders_lk_app/screens/widgets/PrimaryButton.dart';
import 'package:tenders_lk_app/screens/widgets/TextInput.dart';

class LoginForm extends StatefulWidget {
  final UserRepositories userRepositories;
  LoginForm({super.key, required this.userRepositories});

  @override
  State<LoginForm> createState() => _LoginFormState(userRepositories);
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  _LoginFormState(UserRepositories userRepositories);

  void onLoginButtonPressed() {
    BlocProvider.of<LoginBloc>(context).add(LoginButtonPressed(
        email: _emailController.text, password: _passwordController.text));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginBlocState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Text(
            'Sign In',
            style: GoogleFonts.getFont('Poppins',
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 27,
                    color: Colors.black)),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginBlocState>(builder: (context, state) {
        return Container(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In',
                    style: GoogleFonts.getFont('Poppins',
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w800,
                            fontSize: 27,
                            color: Colors.black)),
                  ),
                  Text(
                    'Sign in with tenders',
                    style: GoogleFonts.getFont('Poppins',
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Colors.black)),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 28,
                  ),
                  TextInput(
                    controller: _emailController,
                    obsecure: false,
                    textInputType: TextInputType.emailAddress,
                    text: 'Enter email or username',
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextInput(
                    controller: _passwordController,
                    obsecure: true,
                    textInputType: TextInputType.visiblePassword,
                    text: 'Enter password',
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  PrimaryButton(
                    text: 'Login to tenders',
                    onPressed: onLoginButtonPressed,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  Center(
                    child: Text(
                      'I don’t have an account',
                      style: GoogleFonts.getFont('Poppins',
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 13,
                              color: Colors.black)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
