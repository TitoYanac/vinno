import '../../data/repositories/recipe_repository_impl.dart';
import '../entities/recipe.dart';
import '../repositores/recipe_repository.dart';

class UsecaseRecipe{
  final RecipeRepository _recipeRepository = RecipeRepositoryImpl();

  Future<List<Recipe>> getRecipes() async{
    return await _recipeRepository.getRecipes();
  }

  Future<List<Recipe>> getRecipesByCategory(String category) async{
    List<Recipe> recipes = await _recipeRepository.getRecipes();
    return [];
  }
}