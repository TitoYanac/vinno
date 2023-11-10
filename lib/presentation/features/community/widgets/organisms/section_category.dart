import 'package:flutter/material.dart';
import 'package:vinno/domain/entities/recipe.dart';
import 'package:vinno/presentation/features/community/widgets/molecules/horizontal_category_list.dart';

import '../molecules/title_section_category.dart';

class SectionCategory extends StatefulWidget {
  const SectionCategory({super.key, required this.category, required this.recipes});
  final String category;
  final List<Recipe> recipes;

  @override
  State<SectionCategory> createState() => _SectionCategoryState();
}

class _SectionCategoryState extends State<SectionCategory> {
  final double _heightSection = 200;
  @override
  Widget build(BuildContext context) {
    // Este widget es un sliver ya, por lo que no necesitas usar SliverToBoxAdapter aquí
    //return Container(child: Center(child: Text(widget.category),),);
    return Column(
      children:
        [
          TitleSectionCategory(title: widget.category), // Este widget puede ser un widget de caja
          SizedBox(
            height: (widget.category=="Más Populares")?228:_heightSection,
            child: HorizontalCategoryList(
              category: widget.category,
              recipes: widget.recipes,
              height: (widget.category=="Más Populares")?228:_heightSection,
            ), // Este widget también puede ser un widget de caja
          ),

          (widget.category=="Más Populares")? SizedBox(height: 12):Container(),
        ],
    );
  }
}
