import 'package:flutter/material.dart';
import 'package:vinno/presentation/features/community/widgets/organisms/section_category.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../../../domain/entities/recipe.dart';

class CommunityBody extends StatefulWidget {
  const CommunityBody({super.key});

  @override
  State<CommunityBody> createState() => _CommunityBodyState();
}

class _CommunityBodyState extends State<CommunityBody> with AutomaticKeepAliveClientMixin {
  List<Recipe> recipes = [];
  List<String> categories = [
    "Más Populares",
    "Nuevas Recetas",
    "Recetas Rápidas y Fáciles",
    "Recetas de Temporada",
    "Clásicos de siempre",
  ];

  @override
  void initState() {
    super.initState();
    fetchRecipes().then((data) {
      if (mounted) {
        setState(() {
          recipes = data;
        });
      }
    });
  }
  @override
  bool get wantKeepAlive => true; // Indica que quieres mantener viva esta pantalla


  Future<List<Recipe>> fetchRecipes() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('recipes').get();
    return querySnapshot.docs.map((doc) => Recipe.fromMap(doc.data() as Map<String, dynamic>)).toList();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context); // Muy importante para AutomaticKeepAliveClientMixin

    return Padding(
      padding: const EdgeInsets.all(28.0),
      child: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                return SectionCategory(
                    recipes: recipes.where((element) => element.categories.contains(categories[index])).toList(),
                    category: categories[index]
                );
              },
              childCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
