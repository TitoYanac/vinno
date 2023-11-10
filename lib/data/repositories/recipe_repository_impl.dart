import '../../domain/entities/recipe.dart';
import '../../domain/repositores/recipe_repository.dart';

class RecipeRepositoryImpl implements RecipeRepository {
  @override
  Future<List<Recipe>> getRecipes() async {
    return [];
  }
}