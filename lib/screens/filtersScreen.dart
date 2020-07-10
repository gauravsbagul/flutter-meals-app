import 'package:flutter/material.dart';

import 'package:meal_app/widgest/mainDrawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = 'filter-screen';

  final Function saveFiltes;
  final Map<String, bool> currentFilters;
  FiltersScreen(this.saveFiltes, this.currentFilters);
  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegan = false;
  var _vegetarian = false;
  @override
  initState() {
    _glutenFree = widget.currentFilters['gluteen'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];
    super.initState();
  }

  Widget _buildSwithcTiele(
      String title, String subTitle, bool value, Function update) {
    return SwitchListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      value: value,
      onChanged: update,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedKeys = {
      'gluteen': _glutenFree,
      'lactose': _lactoseFree,
      'vegan': _vegan,
      'vegetarian': _vegetarian,
    };
    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () => widget.saveFiltes(selectedKeys))
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwithcTiele('Gluten-free',
                    'Only include gluten-freen meals', _glutenFree, (newValue) {
                  setState(() {
                    _glutenFree = newValue;
                  });
                }),
                _buildSwithcTiele(
                    'Lactose-free',
                    'Only include lactose-freen meals',
                    _lactoseFree, (newValue) {
                  setState(() {
                    _lactoseFree = newValue;
                  });
                }),
                _buildSwithcTiele('Vegan', 'Only include vegan meals', _vegan,
                    (newValue) {
                  setState(() {
                    _vegan = newValue;
                  });
                }),
                _buildSwithcTiele(
                    'Vegetarian', 'Only include vegetarian meals', _vegetarian,
                    (newValue) {
                  setState(() {
                    _vegetarian = newValue;
                  });
                }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
