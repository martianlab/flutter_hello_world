import 'package:flutter/material.dart';
import 'package:flutter_hello_world/constants.dart';
import 'header_with_searchbox.dart';
import 'recipe_category.dart';
import 'title_with_more_button.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          children: <Widget>[
            HeaderWithSearchBox(size: size),
            TitleWithMoreButton(
                title: "Первые блюда",
                press: (){}
            ),
            RecipeCategory()
          ],
        )
    );
  }
}

