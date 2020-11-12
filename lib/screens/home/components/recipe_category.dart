import 'package:flutter/material.dart';

import '../../../constants.dart';

class RecipeCategory extends StatelessWidget {
  const RecipeCategory({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          RecipeCard(
              image: "https://gcdn.utkonos.ru/resample/recipe-mobile/images/recipe/recipe_4867_A49C50A52A7F5BE9C88FA5169486A3E6-_A7A1461.jpg",
              title: "Куриный бульон",
              difficult: "средняя",
              countOfPerson: 4,
              press: (){}
          ),
          RecipeCard(
              image: "https://gcdn.utkonos.ru/resample/recipe-mobile/images/recipe/20200709161452-final.jpg",
              title: "Свекольник",
              difficult: "низкая",
              countOfPerson: 4,
              press: (){}
          ),
          RecipeCard(
              image: "https://gcdn.utkonos.ru/resample/recipe-mobile/images/recipe/20200430160301-final.jpg",
              title: "Крем-суп с гречкой и печенью",
              difficult: "средняя",
              countOfPerson: 4,
              press: (){}
          ),
        ],
      ),
    );
  }
}

class RecipeCard extends StatelessWidget {
  const RecipeCard({
    Key key,
    this.image,
    this.title,
    this.difficult,
    this.countOfPerson,
    this.press
  }) : super(key: key);

  final String image, title, difficult;
  final int countOfPerson;
  final Function press;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
        margin: EdgeInsets.only(
            left: kDefaultPadding,
            top: kDefaultPadding / 2,
            bottom: kDefaultPadding * 2.5
        ),
        width: size.width * 0.4,
        child: Column(
          children: [
            Image.network(image, fit: BoxFit.cover,),
            GestureDetector(
                onTap: press,
                child: Container(
                    padding: EdgeInsets.all(kDefaultPadding/2),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0,10),
                              blurRadius: 50,
                              color: kPrimaryColor.withOpacity(0.23)
                          )
                        ]
                    ),
                    child: Row(
                      children: <Widget>[
                        RichText(
                            text: TextSpan(
                                children: [
                                  TextSpan(
                                      text:"$title\n".toUpperCase(),
                                      style: Theme.of(context).textTheme.button
                                  ),
                                  TextSpan(
                                      text: "$difficult".toUpperCase(),
                                      style: TextStyle(
                                          color: kPrimaryColor.withOpacity(0.5)
                                      )
                                  )
                                ]
                            )
                        ),
                        Spacer(),
                        Text(
                            "$countOfPerson",
                            style: Theme.of(context).textTheme.button.copyWith(color: kPrimaryColor)

                        )
                      ],
                    )
                )
            )
          ],
        )
    );
  }
}