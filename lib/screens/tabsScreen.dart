import 'package:flutter/material.dart';
import 'package:meal_app/models/meal.dart';

import 'package:meal_app/widgest/mainDrawer.dart';
import 'categoriesScreen.dart';
import 'favoriteScreen.dart';

class TabsScreen extends StatefulWidget {
  final List<Meal> favoritedmeals;
  TabsScreen(this.favoritedmeals);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _screens;
  int _selectedScreenIndex = 0;

  @override
  initState() {
    _screens = [
      {
        'screen': CategoriesScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavoriteScreen(widget.favoritedmeals),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  void _slectPage(index) {
    print('INDEX: ${index}');
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _slectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text('Categories')),
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.star),
              title: Text('Favorites')),
        ],
      ),
    );
  }
}
