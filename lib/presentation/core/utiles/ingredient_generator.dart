import 'dart:math';

class IngredientGenerator {
  final List<String> _ingredients = [
    'Papa', 'Maíz', 'Arroz', 'Quinua', 'Ají amarillo', // y muchos más...
    // (continúa la lista hasta llegar a 100 ingredientes)
  ];

  // Función para obtener una lista aleatoria de ingredientes
  List<dynamic> getRandomIngredients(int count) {
    if (count > _ingredients.length || count < 1) {
      throw ArgumentError('Count must be between 1 and ${_ingredients.length}');
    }
    final random = Random();
    final shuffledIngredients = List.from(_ingredients)..shuffle(random);
    return shuffledIngredients.take(count).toList();
  }
}

void main() {
  final ingredientGenerator = IngredientGenerator();
  final randomIngredients = ingredientGenerator.getRandomIngredients(5);
  print(randomIngredients);  // Imprime una lista de 5 ingredientes aleatorios
}
