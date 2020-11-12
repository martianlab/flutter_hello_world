import 'package:flutter/material.dart';

class Recipe {
  final int id;
  final String image;
  final String title;
  final String difficult;
  final int countOfPerson;
  Recipe({
    this.id,
    this.image,
    this.title,
    this.difficult,
    this.countOfPerson,
  });
}

List<Recipe> recipes = [
  Recipe(
      id: 1,
      title: "Office Code",
      image: "https://gcdn.utkonos.ru/resample/recipe-mobile/images/recipe/recipe_4867_A49C50A52A7F5BE9C88FA5169486A3E6-_A7A1461.jpg",
      difficult: "средняя",
      countOfPerson: 12,),
];