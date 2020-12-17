import 'package:eatmeals/Widgets/drawer.dart';
import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filter-meals';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  FilterScreen(this.saveFilters, this.currentFilters);
  @override
  _FilterScreenState createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  initstate() {
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegetarian = widget.currentFilters['vegetarian'];

    super.initState();
  }

  Widget _buildSwitchListTile(
    String title,
    String subtitle,
    Function updateValue,
    bool currentValue,
  ) {
    return SwitchListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.headline6,
      ),
      value: currentValue,
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My filters'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.save),
              onPressed: () {
                final selectedFilters = {
                  'gluten': _glutenFree,
                  'lactose': _lactoseFree,
                  'vegan': _vegan,
                  'vegetarian': _vegetarian,
                };
                widget.saveFilters(selectedFilters);
              })
        ],
      ),
      drawer: Mydrawer(),
      body: Column(
        children: <Widget>[
          Container(
            height: 120,
            padding: EdgeInsets.all(20),
            child: Center(
              child: Text('Adjust your meal selection',
                  style: Theme.of(context).textTheme.bodyText1),
            ),
          ),
          Expanded(
              child: ListView(
            children: <Widget>[
              _buildSwitchListTile(
                  'gluten-free', 'Only include gluten-free meals', (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }, _glutenFree),
              _buildSwitchListTile(
                  'Lactose-free', 'Only include Lactose-free meals',
                  (newValue) {
                setState(
                  () {
                    _lactoseFree = newValue;
                  },
                );
              }, _lactoseFree),
              _buildSwitchListTile(
                  'Vegetarian', 'Only include Vegetarian meals', (newValue) {
                setState(
                  () {
                    _vegetarian = newValue;
                  },
                );
              }, _vegetarian),
              _buildSwitchListTile('vegan', 'Only include vegan meals',
                  (newValue) {
                setState(
                  () {
                    _vegan = newValue;
                  },
                );
              }, _vegan),
            ],
          ))
        ],
      ),
    );
  }
}
