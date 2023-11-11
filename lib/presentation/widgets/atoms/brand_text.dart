import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class BrandText extends StatelessWidget {
  const BrandText({super.key, required this.title, required this.color});
  final String title;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(
      'Vinno',
      style: GoogleFonts.lobster(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
