import 'package:flutter/material.dart';

import 'package:meal_app/dummyData.dart';

import 'package:meal_app/widgest/categoryItem.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      children: DUMMY_CATEGORIES.map((catData) {
        return CategoryItem(catData.title, catData.color, catData.id);
      }).toList(),
    );
  }
}
