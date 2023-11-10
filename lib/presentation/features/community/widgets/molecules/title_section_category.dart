import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSectionCategory extends StatefulWidget {
  const TitleSectionCategory({super.key, required this.title});
  final String title;

  @override
  State<TitleSectionCategory> createState() => _TitleSectionCategoryState();
}

class _TitleSectionCategoryState extends State<TitleSectionCategory> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            widget.title,
            style: GoogleFonts.lobster(
              fontSize: 18.0,
              fontWeight: FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }
}
