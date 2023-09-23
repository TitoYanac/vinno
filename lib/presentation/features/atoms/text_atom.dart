import 'package:flutter/material.dart';
class TextAtom extends StatefulWidget {
  const TextAtom({super.key});

  @override
  State<TextAtom> createState() => _TextAtomState();
}

class _TextAtomState extends State<TextAtom> {
  @override
  Widget build(BuildContext context) {
    return Text("hola mundo",style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),);
  }
}
