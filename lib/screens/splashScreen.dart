import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenders_lk_app/bloc/authentication/auth_bloc.dart';
import 'package:tenders_lk_app/repositories/repositories.dart';
import 'package:tenders_lk_app/screens/home/HomeScreen.dart';
import 'package:tenders_lk_app/screens/login/loginScreen.dart';

class SplashScreen extends StatefulWidget {
  final UserRepositories userRepositories;
  const SplashScreen({super.key, required this.userRepositories});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (_) {
          return BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is AuthenticateUninitialized) {
                return LoginScreen();
              } else if (state is AuthenticateAuthenticated) {
                return const HomeScreen();
              } else {
                return LoginScreen();
              }
            },
          );
        },
      ));
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(color: Color.fromRGBO(255, 92, 0, 1)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'TENDERS.LK',
              style: GoogleFonts.getFont('Poppins',
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w900,
                      fontStyle: FontStyle.italic,
                      fontSize: 25,
                      color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
