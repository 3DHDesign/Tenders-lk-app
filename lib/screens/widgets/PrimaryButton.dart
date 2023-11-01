import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 45,
        child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(
              Color.fromARGB(255, 255, 92, 0),
            ),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8.0), // Adjust the radius as needed
              ),
            ),
          ),
          onPressed: () {
            Navigator.pushNamed(context, '/homeScreen');
          },
          child: Text(
            'Login to tenders',
            style: GoogleFonts.getFont('Poppins',
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                )),
          ),
        ),
      ),
    );
  }
}
