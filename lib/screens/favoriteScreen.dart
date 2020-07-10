import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgest/mealItem.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Meal> favoritedmeals;
  FavoriteScreen(this.favoritedmeals);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: favoritedmeals.isEmpty
          ? Text('FavoriteScreen')
          : ListView.builder(
              itemCount: favoritedmeals.length,
              itemBuilder: (context, index) {
                final catMeal = favoritedmeals[index];
                return MealItem(
                  id: catMeal.id,
                  title: catMeal.title,
                  imageUrl: catMeal.imageUrl,
                  categories: catMeal.categories,
                  duration: catMeal.duration,
                  complexity: catMeal.complexity,
                  affordability: catMeal.affordability,
                );
              }),
    );
  }
}
