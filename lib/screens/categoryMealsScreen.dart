import 'package:flutter/material.dart';

import 'package:meal_app/dummyData.dart';
import 'package:meal_app/widgest/mealItem.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = 'categories-meals';
  // final String categorId;
  // final String categorTitle;
  // final Color color;

  // CategoryMealsScreen(this.categorTitle, this.categorId, this.color);

  @override
  Widget build(BuildContext context) {
    final routesArgs =
        ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
    final id = routesArgs['id'];
    final title = routesArgs['title'];
    final color = routesArgs['color'];

    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(id);
    }).toList();

    return Scaffold(
        appBar: AppBar(
          title: Text(title),
          backgroundColor: color,
        ),
        body: ListView.builder(
            itemCount: categoryMeals.length,
            itemBuilder: (context, index) {
              final catMeal = categoryMeals[index];
              return MealItem(
                title: catMeal.title,
                imageUrl: catMeal.imageUrl,
                categories: catMeal.categories,
                duration: catMeal.duration,
                complexity: catMeal.complexity,
                affordability: catMeal.affordability,
              );
            }));
  }
}
