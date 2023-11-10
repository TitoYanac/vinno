import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CreateRandomRecipeTest extends StatefulWidget {
  const CreateRandomRecipeTest({super.key});

  @override
  State<CreateRandomRecipeTest> createState() => _CreateRandomRecipeTestState();
}

class _CreateRandomRecipeTestState extends State<CreateRandomRecipeTest> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void saveRecipeToFirebase() {
    _firestore
        .collection('recipes')
        .doc('Tacos de Pescado')
        .set(
        {
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
        }
    )
        .then((value) => print("Receta guardada con éxito"))
        .catchError((error) => print("Error al guardar la receta: $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Guardar Receta en Firebase'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: saveRecipeToFirebase,
          child: const Text('Guardar Receta'),
        ),
      ),
    );
  }
}
