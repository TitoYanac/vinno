import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UnderConstructionScreen extends StatelessWidget {
  const UnderConstructionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.build,
            size: 100,
            color: Colors.blue,
          ),
          const SizedBox(height: 20),
          Text(
            'Página en Construcción',
            style: GoogleFonts.lobster(fontSize: 40),
          ),
        ],
      ),
    );
  }
}
