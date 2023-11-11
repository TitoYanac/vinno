import 'package:flutter/material.dart';

class FilteredDropdown extends StatefulWidget {
  final List<String> items;

  const FilteredDropdown({required this.items});

  @override
  _FilteredDropdownState createState() => _FilteredDropdownState();
}

class _FilteredDropdownState extends State<FilteredDropdown> {
  late TextEditingController _filterController;
  String _selectedItem = '';

  @override
  void initState() {
    super.initState();
    _filterController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _filterController,
          decoration: InputDecoration(labelText: 'Filter'),
          onChanged: (value) {
            setState(() {
              // Handle filter changes
            });
          },
        ),
        DropdownButton<String>(
          value: _selectedItem.isNotEmpty && widget.items.contains(_selectedItem)
              ? _selectedItem
              : null,
          onChanged: (value) {
            setState(() {
              _selectedItem = value!;
              _filterController.text = value;
            });
          },
          items: widget.items
              .where((item) =>
              item.toLowerCase().contains(_filterController.text.toLowerCase()))
              .map((item) => DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          ))
              .toList(),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Filtered Dropdown'),
        ),
        body: Center(
          child: FilteredDropdown(
            items: ['Apple', 'Banana', 'Cherry', 'Date', 'Grapes', 'Kiwi'],
          ),
        ),
      ),
    ),
  );
}
