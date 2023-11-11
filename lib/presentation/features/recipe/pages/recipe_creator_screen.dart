import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vinno/presentation/features/community/widgets/organisms/section_update_recipe_steps.dart';

import '../../../../domain/entities/ingredients.dart';
import '../../community/widgets/organisms/section_update_recipe_data.dart';
import '../../community/widgets/organisms/section_update_recipe_image.dart';
import '../../community/widgets/organisms/section_update_recipe_ingredients.dart';

class RecipeCreatorScreen extends StatefulWidget {
  const RecipeCreatorScreen({super.key});

  @override
  State<RecipeCreatorScreen> createState() => _RecipeCreatorScreenState();
}

class _RecipeCreatorScreenState extends State<RecipeCreatorScreen> {
  File? _image;
  String? _imageUrl;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  final TextEditingController _nameRecipeController = TextEditingController();
  final TextEditingController _numPersonsController = TextEditingController();
  final TextEditingController _difficultyController = TextEditingController();
  String _countrySelected = "";

  List<Ingredients> _allIngredients = [];
  List<String> _allSteps = [];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SectionUpdateRecipeImage(onImageSelected: (image) {
            setState(() {
              _image = image;
            });
          }),
          SectionUpdateRecipeData(
            nameRecipeController: _nameRecipeController,
            numPersonsController: _numPersonsController,
            difficultyController: _difficultyController,
            onCountrySelected: (country) {
              setState(() {
                _countrySelected = country;
              });
            }
          ),
          SectionUpdateRecipeIngredients(
            onIngredientsChanged: (ingredients) {
              // Actualiza la lista de ingredientes en el widget que contiene
              setState(() {
                _allIngredients = ingredients;
              });
            },
          ),
          SectionUpdateRecipeSteps(
            onStepsChanged: (steps) {
              setState(() {
                _allSteps = steps;
              });
            }
          ),
          /*
          SectionUpdateRecipeCategories(),
          SectionUpdateRecipeDescription(),*/
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: (){

                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Theme.of(context).colorScheme.surface),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.file_copy,
                            color: Color.fromRGBO(120, 120, 120, 1),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Borrador',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: const Color.fromRGBO(120, 120, 120, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _saveRecipe,
                    child: Container(
                      margin: EdgeInsets.all(15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.cloud_upload,
                            color: Color.fromRGBO(253, 253, 253, 1),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Text(
                            'Público',
                            style: GoogleFonts.roboto(
                              fontSize: 16,
                              color: const Color.fromRGBO(253, 253, 253, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _saveRecipe() async {
    print("lickeado");
/*    if (_nameRecipeController.text.isEmpty ||
        _numPersonsController.text.isEmpty ||
        _difficultyController.text.isEmpty ||
        _countrySelected.isEmpty ||
        _image == null ||
        _allIngredients.isEmpty ||
        _allSteps.isEmpty) {
      return;
    }*/

    // Subir la imagen a Firebase Storage
    final storageRef = _storage.ref().child('recipe_images/${DateTime.now()}.jpg');
    await storageRef.putFile(_image!);

    // Obtener la URL de la imagen
    final imageUrl = await storageRef.getDownloadURL();

    // Construir los datos de la receta
    final recipeData = {
      'name': _nameRecipeController.text,
      'numPersons': int.parse(_numPersonsController.text),
      'difficulty': int.parse(_difficultyController.text),
      'country': _countrySelected,
      'imageUrl': imageUrl,
      'ingredients': _allIngredients.map((ingredient) => {
        'name': ingredient.name,
        'unit': ingredient.unid,
      }).toList(),
      'steps': _allSteps,
      // Agrega cualquier otro campo que necesites
    };

    final recipeData2 = {
      "name": "Tacos de Pescado",
      "creatorName": "Carlos Ruiz",
      "creatorImage": "url_a_la_imagen_de_carlos.jpg",
      "image": "url_a_la_imagen_de_tacos_de_pescado.jpg",
      "rating": 4.6,
      "cookingTime": 20,
      "servings": 4,
      "ingredients": [
        "400g de filetes de pescado blanco",
        "8 tortillas de maíz",
        "200g de repollo morado rallado",
        "2 aguacates maduros",
        "1 limón",
        "100g de crema fresca",
        "2 cucharadas de aceite de oliva",
        "1 cucharadita de chile en polvo",
        "1 cucharadita de comino en polvo",
        "Sal y pimienta al gusto",
        "Cilantro fresco picado para decorar",
        "Salsa picante al gusto"
      ],
      "steps": [
        "Sazonar los filetes de pescado con chile en polvo, comino, sal y pimienta.",
        "Calentar el aceite en una sartén y cocinar el pescado hasta que esté dorado y cocido.",
        "Calentar las tortillas en una sartén o comal.",
        "Desmenuzar el pescado cocido con un tenedor.",
        "Cortar los aguacates por la mitad, retirar el hueso y hacer un puré con su carne, luego sazonar con limón, sal y pimienta.",
        "Armar los tacos colocando una base de puré de aguacate en cada tortilla, luego el pescado y el repollo rallado por encima.",
        "Añadir un toque de crema fresca y cilantro picado.",
        "Servir inmediatamente con limón y salsa picante al lado."
      ],
      "categories": ["Plato principal", "Comida Mexicana"],
      "creationDate": "2023-11-08T14:00:00Z",
      "lastModifiedDate": "2023-11-08T14:30:00Z",
      "nutritionInfo": {
        "calories": 350,
        "fat": 15,
        "protein": 25,
        "carbohydrates": 35
      },
      "utensils": ["Sartén", "Comal o sartén para tortillas", "Cuchillo", "Tabla de cortar"],
      "difficulty": 2,
      "estimatedCost": 12.00,
      "preparationTime": 15,
      "additionalInstructions": "Añadir otras verduras frescas como tomate o cebolla si se desea.",
      "comments": [],
      "stepImages": [],
      "videoUrl": "",
      "tags": ["fresco", "rápido"],
      "season": "Todo el año",
      "occasion": "Comida casual",
      "allergens": ["pescado"],
      "dietaryRestrictions": [],
      "source": "Recetario de Tacos Mexicanos",
      "favoriteCount": 250,
      "sharedCount": 130,
      "isPublished": true,
      "notes": "Para una versión más ligera, se puede usar yogur griego en lugar de crema fresca."
    };

    // Guardar los datos en Firestore
    await _firestore.collection('recipes').add(recipeData);

    // Muestra un mensaje de éxito o realiza alguna acción adicional
  }

}
