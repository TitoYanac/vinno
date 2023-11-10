  import 'package:flutter/material.dart';
  import 'package:vinno/domain/entities/recipe.dart';
  import 'package:vinno/presentation/core/services/recipe/service_recipe.dart';
  import 'package:vinno/presentation/features/recipe/widgets/molecules/recipe_card.dart';

  class HorizontalCategoryList extends StatefulWidget {
    const HorizontalCategoryList({super.key, required this.category, required this.recipes, required this.height});
    final String category;
    final List<Recipe> recipes;
    final double height;

    @override
    State<HorizontalCategoryList> createState() => _HorizontalCategoryListState();
  }

  class _HorizontalCategoryListState extends State<HorizontalCategoryList> {
    @override
    Widget build(BuildContext context) {
      return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.recipes.length,
        itemBuilder: (context, index) {
          return RecipeCard(recipe: widget.recipes[index], height: widget.height,);
        },
      );
    }
  }
