import 'package:flutter/material.dart';
import 'package:vinno/domain/entities/recipe.dart';
import 'package:like_button/like_button.dart';

class RecipeCard extends StatefulWidget {
  const RecipeCard({super.key, required this.recipe, required this.height});
  final Recipe recipe;
  final double height;

  @override
  State<StatefulWidget> createState() => _RecipeCardState();
}

class _RecipeCardState extends State<RecipeCard> {
  late bool _isLiked;
  late Recipe _recipe;
  late double _heightCard;
  @override
  void initState() {
    _isLiked = false;
    _recipe = widget.recipe;
    _heightCard = widget.height;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: SizedBox(
        width: _heightCard * 247 / 228,
        height: _heightCard,
        child: Card(
          clipBehavior: Clip.hardEdge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          elevation: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 152,
                child: Container(
                  color: Colors.transparent,
                  child: Image.network(widget.recipe.image, fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return const LinearProgressIndicator();
                    }
                  }),
                ),
              ),
              Expanded(
                flex: 76,
                child: Container(
                  color: Colors.transparent,
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 48,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 20,
                              child: Container(
                                color: Colors.transparent,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FittedBox(
                                      fit: BoxFit.fitHeight,
                                      child: Container(
                                        color: Colors.transparent,
                                        child: Text(
                                          widget.recipe.name,
                                          textAlign: TextAlign.left,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(flex: 4, child: Container()),
                            Expanded(
                              flex: 20,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FittedBox(
                                    fit: BoxFit.fitHeight,
                                    child: LikeButton(
                                      circleColor:
                                      const CircleColor(start: Color(0xff00ddff), end: Color(0xff0099cc)),
                                      bubblesColor: const BubblesColor(
                                        dotPrimaryColor: Color(0xff33b5e5),
                                        dotSecondaryColor: Color(0xff0099cc),
                                      ),
                                      likeBuilder: (bool isLiked) {
                                        return Icon(
                                          Icons.favorite,
                                          color: isLiked ? Colors.deepPurpleAccent : Colors.grey,
                                        );
                                      },
                                      likeCount: widget.recipe.favoriteCount,
                                      countBuilder: (int? count, bool isLiked, String text) {
                                        var color = isLiked ? Colors.deepPurpleAccent : Colors.grey;
                                        Widget result;
                                        if (count == 0) {
                                          result = Text(
                                            "0",
                                            style: TextStyle(color: color),
                                          );
                                        } else {
                                          result = Text(
                                            text,
                                            style: TextStyle(color: color),
                                          );
                                        }
                                        return Container(color:Colors.transparent,child: FittedBox(fit: BoxFit.fitHeight,child: result));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //Expanded(flex: 4, child: Container()),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 28,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 31,
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 12,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Icon(
                                        Icons.star,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 17,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        widget.recipe.rating.toString(),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(flex: 8,child: Container()),
                            Expanded(
                              flex: 51,
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 12,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Icon(
                                        Icons.timer,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 37,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          "${widget.recipe.cookingTime} min",
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(flex: 8,child: Container()),
                            Expanded(
                              flex: 28,
                              child: Row(
                                children: [
                                  const Expanded(
                                    flex: 12,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Icon(
                                        Icons.groups,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 14,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Text(
                                        "${widget.recipe.servings}p",
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 105,
                              child: Row(
                                children: [

                                  Expanded(flex: 17,child: Container()),
                                  Expanded(
                                    flex: 60,
                                    child: Text(
                                      "${widget.recipe.creatorName} daasdasd",
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: _heightCard * 0.04,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 8,
                                    child: Container(),
                                  ),
                                  Expanded(
                                    flex: 20,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: CircleAvatar(
                                        backgroundImage: NetworkImage(
                                          widget.recipe.creatorImage
                                        ),
                                      ),
                                    ),
                                  ),

                                  Expanded(flex: 8,child: Container()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
/*
  Widget _buildRecipeImage() {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
          child: Image.network(
            widget.recipe.image,
            fit: BoxFit.cover,
            height: 200,
            width: double.infinity,
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: _isLiked ? Colors.red : Colors.white,
          ),
          onPressed: () {
            setState(() {
              _isLiked = !_isLiked;
            });
          },
        ),
      ],
    );
  }

  Widget _buildRecipeInfo() {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          Text(
            widget.recipe.name,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildIconText(Icons.star, widget.recipe.rating.toString()),
              _buildIconText(
                  Icons.access_time, '${widget.recipe.cookingTime} m'),
              _buildIconText(Icons.people, '${widget.recipe.servings} p'),
              _buildUserInfo(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(widget.recipe.creatorImage),
        ),
        SizedBox(width: 8),
        Text(
          widget.recipe.creatorName,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
  */
}
