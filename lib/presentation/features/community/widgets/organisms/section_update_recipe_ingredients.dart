import 'package:flutter/material.dart';

import '../../../../../domain/entities/ingredients.dart';
import '../molecules/unit_dropdown.dart';

class SectionUpdateRecipeIngredients extends StatefulWidget {
  final Function(List<Ingredients>) onIngredientsChanged;
  const SectionUpdateRecipeIngredients({super.key, required this.onIngredientsChanged});

  @override
  State<SectionUpdateRecipeIngredients> createState() => _SectionUpdateRecipeIngredientsState();
}

class _SectionUpdateRecipeIngredientsState extends State<SectionUpdateRecipeIngredients> {
  final List<Ingredients> _ingredientes = [];
  final TextEditingController _nameIngredientController = TextEditingController();


  String _selectedUnidadMedida = 'Gr';

  void _addTag() {
    String tag = _nameIngredientController.text.trim();
    if (tag.isNotEmpty && !_ingredientes.contains(tag)) {
      setState(() {
        _ingredientes.add(Ingredients(name: tag, unid: _selectedUnidadMedida));
        _nameIngredientController.clear();
        widget.onIngredientsChanged(_ingredientes);

      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        title: const Text('Ingredientes'),
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 24),
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: 'Ingrediente',
                      fillColor: Theme.of(context).colorScheme.surface,
                      floatingLabelBehavior: FloatingLabelBehavior
                          .auto, // O FloatingLabelBehavior.never
                    ),
                    controller: _nameIngredientController,
                  ),
                ),
                const SizedBox(width: 8,),
                Expanded(
                  flex: 2,
                  child: UnitDropdown(
                    units: [ 'Gr', 'Lt', 'Kg', 'mill.', 'pieces', 'cups'],
                    initValue: _selectedUnidadMedida,
                    onUnitSelected: (selectedUnit) {
                      print('Selected Unit: $selectedUnit');
                      setState(() {
                        _selectedUnidadMedida = selectedUnit;
                      });
                    },
                  ),
                ),
              ],
            ),

          ),
          ElevatedButton(
            onPressed: _addTag,
            child: const Text('Agregar'),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: _ingredientes.map((item) {
              return Chip(
                label: Row(
                  children: [
                    Text(item.name),
                    const SizedBox(width: 4),
                    Text(item.unid)
                  ],
                ),
                onDeleted: () {
                  setState(() {
                    _ingredientes.remove(item);
                    widget.onIngredientsChanged(_ingredientes);

                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }




}
