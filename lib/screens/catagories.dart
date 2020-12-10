import 'package:eatmeals/Widgets/categoryitem.dart';
import 'package:flutter/material.dart';
import '../typeoffood.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: GridView(
          children: Dummy_Category.map((catData) =>
              CategoryItem(catData.id, catData.title, catData.color)).toList(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20),
        ),
      ),
    );
  }
}
