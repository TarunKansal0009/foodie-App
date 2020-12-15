import './screens/meals_details_screen.dart';
import 'package:eatmeals/screens/recipes_of_category.dart';
import 'package:flutter/material.dart';
import './screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'delimeals',
        theme: ThemeData(
          primarySwatch: Colors.green,
          accentColor: Colors.greenAccent,
          canvasColor: Color.fromRGBO(255, 254, 222, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.dark().textTheme.copyWith(
                bodyText1: TextStyle(
                  color: Color.fromRGBO(20, 51, 51, 1),
                ),
                bodyText2: TextStyle(
                  color: Color.fromRGBO(25, 25, 56, 1),
                ),
                headline6: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed'),
              ),
        ),
        routes: {
          '/': (ctx) => TabsBar(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailScreen.routeName: (ctx) => MealDetailScreen()
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(
            builder: (ctx) => CategoryMealsScreen(),
          );
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(builder: (ctx) => CategoryMealsScreen());
        });
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meals App'),
      ),
      body: Center(
        child: Text(
          'Navigation Bar',
          style: TextStyle(color: Colors.green),
        ),
      ),
    );
  }
}
