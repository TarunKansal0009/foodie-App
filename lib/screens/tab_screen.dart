import 'package:eatmeals/Widgets/drawer.dart';
import 'package:eatmeals/models/meals.dart';
import 'package:eatmeals/screens/catagories.dart';
import './Favorite_recipe.dart';
import 'package:flutter/material.dart';

class TabsBar extends StatefulWidget {
  final List<Meal> favoriteMeal;
  TabsBar(this.favoriteMeal);
  @override
  _TabsBarState createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  int _selectedTabindex = 0;

  List<Map<String, Object>> tabs;

  @override
  void initState() {
    tabs = [
      {'tabs': CategoriesScreen(), 'title': 'Categories'},
      {'tabs': Favorite(widget.favoriteMeal), 'title': 'Favorite'},
    ];
    super.initState();
  }

  void _selectedTab(int index) {
    setState(() {
      _selectedTabindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          tabs[_selectedTabindex]['title'],
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        onTap: _selectedTab,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedTabindex,
        selectedFontSize: 12,
        unselectedFontSize: 15,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Category',
            backgroundColor: Theme.of(context).primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
            backgroundColor: Theme.of(context).primaryColor,
          )
        ],
      ),
      body: tabs[_selectedTabindex]['tabs'],
      drawer: Mydrawer(),
    );
  }
}
