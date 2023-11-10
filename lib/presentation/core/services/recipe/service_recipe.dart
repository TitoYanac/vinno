import 'package:vinno/domain/usecases/usecase_recipe.dart';

import '../../../../domain/entities/recipe.dart';

class ServiceRecipe{
  Future<List<Recipe>> getRecipes() async{

    return [];
  }
  Future<List<Recipe>> getRecipesByCategory(String category) async{
    await UsecaseRecipe().getRecipesByCategory(category);
    return [];
  }
}