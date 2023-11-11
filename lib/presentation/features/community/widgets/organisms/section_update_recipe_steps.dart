import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SectionUpdateRecipeSteps extends StatefulWidget {
  const SectionUpdateRecipeSteps({super.key, required this.onStepsChanged});
  final Function(List<String>) onStepsChanged;


  @override
  State<SectionUpdateRecipeSteps> createState() => _SectionUpdateRecipeStepsState();
}

class _SectionUpdateRecipeStepsState extends State<SectionUpdateRecipeSteps> {
  List<String> _Steps = [];
  final TextEditingController _nameStepController = TextEditingController();

  User? user = FirebaseAuth.instance.currentUser;

  void _addTag() {
    String tag = _nameStepController.text.trim();
    if (tag.isNotEmpty && !_Steps.contains(tag)) {
      setState(() {
        _Steps.add(tag);
        _nameStepController.clear();
        widget.onStepsChanged(_Steps);
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: ExpansionTile(
        title: const Text('Preparación'),
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
                      labelText: 'Paso',
                      fillColor: Theme.of(context).colorScheme.surface,
                      floatingLabelBehavior: FloatingLabelBehavior
                          .auto, // O FloatingLabelBehavior.never
                    ),
                    controller: _nameStepController,
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
            children: _Steps.map((item) {
              return Chip(
                label: Row(
                  children: [
                    Text(item)
                  ],
                ),
                onDeleted: () {
                  setState(() {
                    _Steps.remove(item);
                    widget.onStepsChanged(_Steps);
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
