import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tenders_lk_app/screens/widgets/PrimaryButton.dart';
import 'package:tenders_lk_app/screens/widgets/TextInput.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Container(
        padding: EdgeInsets.all(35.0),
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
                  height: 24,
                ),
                TextInput(
                  controller: emailController,
                  obsecure: false,
                  textInputType: TextInputType.emailAddress,
                  text: 'Enter email or username',
                ),
                const SizedBox(
                  height: 10,
                ),
                TextInput(
                  controller: passwordController,
                  obsecure: true,
                  textInputType: TextInputType.visiblePassword,
                  text: 'Enter password',
                ),
                const SizedBox(
                  height: 15,
                ),
                PrimaryButton(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
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
      ),
    );
  }
}
