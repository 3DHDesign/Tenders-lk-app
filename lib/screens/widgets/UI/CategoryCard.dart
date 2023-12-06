import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.tenderCount,
      required this.categoryText,
      required this.categoryColor,
      required this.categoryImage});

  final int tenderCount;
  final String categoryText, categoryImage, categoryColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: 150,
        height: 200,
        decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          children: [
            Positioned(
                top: 20,
                right: 20,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: Colors.orange.shade800,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    '${tenderCount}',
                    style: GoogleFonts.getFont('Poppins',
                        textStyle: const TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                            fontWeight: FontWeight.w700)),
                  ),
                )),
            Positioned(
                top: 10,
                left: 10,
                child: Image.asset(
                    'assets/images/icons/Automobile and transport.png',
                    width: 80,
                    height: 80)),
            Positioned(
                bottom: 20,
                left: 20,
                child: SizedBox(
                  width: 150,
                  child: Text(
                    categoryText,
                    style: GoogleFonts.getFont('Poppins',
                        textStyle: const TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.w500)),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
