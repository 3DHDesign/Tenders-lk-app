import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextInput extends StatelessWidget {
  TextInput(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obsecure});

  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obsecure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        keyboardType: textInputType,
        obscureText: obsecure,
        controller: controller,
        decoration: InputDecoration(
            hintText: text,
            border: InputBorder.none,
            hintStyle: GoogleFonts.getFont(
              'Poppins',
              textStyle: const TextStyle(
                color: Colors.grey,
                fontSize: 14,
              ),
            )),
      ),
    );
  }
}
