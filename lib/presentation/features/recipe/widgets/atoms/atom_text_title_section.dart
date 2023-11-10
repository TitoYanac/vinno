import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AtomTextTitleSection extends StatefulWidget {
  const AtomTextTitleSection({super.key, required this.title});
  final String title;

  @override
  State<AtomTextTitleSection> createState() => _AtomTextTitleSectionState();
}

class _AtomTextTitleSectionState extends State<AtomTextTitleSection> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0,top: 24.0,right: 16.0,bottom: 16),
      child: Text(
        widget.title,
        style: GoogleFonts.lobster(
          fontSize: 20.0,
        ),
      ),
    );
  }
}
