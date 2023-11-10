import 'package:flutter/material.dart';

class RecipeCreatorScreen extends StatefulWidget {
  const RecipeCreatorScreen({super.key});

  @override
  State<RecipeCreatorScreen> createState() => _RecipeCreatorScreenState();
}

class _RecipeCreatorScreenState extends State<RecipeCreatorScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _creatorNameController = TextEditingController();
  final TextEditingController _creatorImageController = TextEditingController();
  final TextEditingController _recipeImageController = TextEditingController();
  final TextEditingController _ratingController = TextEditingController();
  final TextEditingController _cookingTimeController = TextEditingController();
  final TextEditingController _servingsController = TextEditingController();
  final TextEditingController _nutritionCaloriesController = TextEditingController();
  final TextEditingController _nutritionFatController = TextEditingController();
  final TextEditingController _nutritionProteinController = TextEditingController();
  final TextEditingController _nutritionCarbsController = TextEditingController();
  final TextEditingController _difficultyController = TextEditingController();
  final TextEditingController _estimatedCostController = TextEditingController();
  final TextEditingController _preparationTimeController = TextEditingController();
  final TextEditingController _additionalInstructionsController = TextEditingController();
  final TextEditingController _videoUrlController = TextEditingController();
  final TextEditingController _seasonController = TextEditingController();
  final TextEditingController _occasionController = TextEditingController();
  final TextEditingController _sourceController = TextEditingController();
  final TextEditingController _notesController = TextEditingController();

  var json = {
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
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          _buildTextField(_nameController, 'Nombre de la Receta'),
          _buildTextField(_creatorNameController, 'Nombre del Creador'),
          _buildTextField(_creatorImageController, 'URL de la Imagen del Creador'),
          _buildTextField(_recipeImageController, 'URL de la Imagen de la Receta'),
          _buildNumberField(_ratingController, 'Rating'),
          _buildNumberField(_cookingTimeController, 'Tiempo de Cocina (minutos)'),
          _buildNumberField(_servingsController, 'Porciones'),
          _buildNumberField(_nutritionCaloriesController, 'Calorías'),
          _buildNumberField(_nutritionFatController, 'Grasas (g)'),
          _buildNumberField(_nutritionProteinController, 'Proteínas (g)'),
          _buildNumberField(_nutritionCarbsController, 'Carbohidratos (g)'),
          _buildNumberField(_difficultyController, 'Dificultad'),
          _buildNumberField(_estimatedCostController, 'Costo Estimado'),
          _buildNumberField(_preparationTimeController, 'Tiempo de Preparación (minutos)'),
          _buildTextField(_additionalInstructionsController, 'Instrucciones Adicionales'),
          _buildTextField(_videoUrlController, 'URL del Video'),
          _buildTextField(_seasonController, 'Temporada'),
          _buildTextField(_occasionController, 'Ocasión'),
          _buildTextField(_sourceController, 'Fuente'),
          _buildTextField(_notesController, 'Notas'),
          ElevatedButton(
            onPressed: _saveRecipe,
            child: Text('Guardar Receta'),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  Widget _buildNumberField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

  void _saveRecipe() async {
    final recipeData = {
      // Aquí recopilaremos los datos de los controladores
    };

    // Lógica para guardar en Firebase
  }
}
