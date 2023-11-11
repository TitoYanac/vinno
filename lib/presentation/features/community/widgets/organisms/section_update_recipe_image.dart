import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SectionUpdateRecipeImage extends StatefulWidget {
  const SectionUpdateRecipeImage({super.key, required this.onImageSelected});
  final Function(File?) onImageSelected;

  @override
  State<SectionUpdateRecipeImage> createState() =>
      _SectionUpdateRecipeImageState();
}

class _SectionUpdateRecipeImageState extends State<SectionUpdateRecipeImage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16.0),
      color: Theme.of(context).colorScheme.surface,
      child: ExpansionTile(
        title: const Text("Subir imagen"),
        tilePadding: const EdgeInsets.all(15.0),
        childrenPadding: const EdgeInsets.all(15.0),
        //collapsedBackgroundColor: Theme.of(context).colorScheme.surface,
        collapsedIconColor: Theme.of(context).colorScheme.primary,
          collapsedTextColor: Theme.of(context).colorScheme.primary,
        backgroundColor: Theme.of(context).colorScheme.surface,
        initiallyExpanded: true,
        children: [
          InkWell(
            onTap: _pickImage,
            child: Container(
              width: double.infinity,
              height: 220.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_image != null ? 0.0 : 15.0),
                border: Border.all(
                  color: Theme.of(context).colorScheme.onSurface,
                  style: BorderStyle.solid,
                ),
              ),
              child: _image == null
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 40.0,
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            'Subir imagen',
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface,
                            ),
                          ),
                        ],
                      ),
                    )
                  : Image.file(
                      _image!,
                      width: double.infinity,
                      height: double.infinity,
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        widget.onImageSelected(_image);
      } else {
        print('No se seleccionó ninguna imagen.');
      }
    });
  }
}
