import './catagories.dart';
import 'package:flutter/material.dart';

class TabsBar extends StatefulWidget {
  @override
  _TabsBarState createState() => _TabsBarState();
}

class _TabsBarState extends State<TabsBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Meals',
            style: Theme.of(context).textTheme.headline6,
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                icon: Icon(Icons.category),
                text: 'Category',
              ),
              Tab(
                icon: Icon(Icons.favorite),
                text: 'Favorite',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            Center(
              child: Text('Yet No favorite!'),
            ),
          ],
        ),
      ),
      initialIndex: 0,
    );
  }
}
