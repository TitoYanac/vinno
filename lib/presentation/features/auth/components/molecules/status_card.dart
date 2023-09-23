import 'package:flutter/material.dart';
import 'package:vinno/presentation/features/atoms/text_atom.dart';
class StatusCard extends StatefulWidget {
  const StatusCard({super.key});

  @override
  State<StatusCard> createState() => _StatusCardState();
}

class _StatusCardState extends State<StatusCard> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      TextAtom(),
      TextAtom(),
      TextAtom(),
      TextAtom(),
    ],);
  }
}
