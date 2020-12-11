import '../models/meals.dart';
import 'package:flutter/material.dart';
import '../screens/recipes_of_category.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Affordability affordability;
  final int duration;
  final Complexity complexity;
  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.affordability,
      @required this.duration,
      @required this.complexity});
  void selectMeals() {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeals,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 5,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                child: Image.network(
                  imageUrl,
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
