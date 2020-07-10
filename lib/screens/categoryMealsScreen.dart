import 'package:flutter/material.dart';

import 'package:meal_app/models/meal.dart';
import 'package:meal_app/widgest/mealItem.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = 'categories-meals';

  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displaedMeals;
  Color appBarColor;
  var _loadedInitiData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitiData) {
      final routesArgs =
          ModalRoute.of(context).settings.arguments as Map<String, dynamic>;
      final id = routesArgs['id'];
      categoryTitle = routesArgs['title'];
      appBarColor = routesArgs['color'];

      displaedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(id);
      }).toList();

      _loadedInitiData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displaedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
        backgroundColor: appBarColor,
      ),
      body: ListView.builder(
          itemCount: displaedMeals.length,
          itemBuilder: (context, index) {
            final catMeal = displaedMeals[index];
            return MealItem(
              id: catMeal.id,
              title: catMeal.title,
              imageUrl: catMeal.imageUrl,
              categories: catMeal.categories,
              duration: catMeal.duration,
              complexity: catMeal.complexity,
              affordability: catMeal.affordability,
              color: appBarColor,
            );
          }),
    );
  }
}
