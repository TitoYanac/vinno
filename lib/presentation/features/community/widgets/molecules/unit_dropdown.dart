import 'package:flutter/material.dart';

class UnitDropdown extends StatefulWidget {
  final List<String> units;
  final Function(String) onUnitSelected;
  final String initValue;

  const UnitDropdown({required this.units, required this.onUnitSelected, required this.initValue});

  @override
  _UnitDropdownState createState() => _UnitDropdownState();
}

class _UnitDropdownState extends State<UnitDropdown> {
  String _selectedUnit = 'Gr';
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: _selectedUnit,
      onChanged: (value) {
        setState(() {
          _selectedUnit = value!;
          widget.onUnitSelected(value);
        });
      },
      items: widget.units
          .map((unit) => DropdownMenuItem<String>(
        value: unit,
        child: Text(unit),
      ))
          .toList(),
      decoration: InputDecoration(
        labelText: 'Medida',
        border: OutlineInputBorder(),
      ),
    );
  }
}
