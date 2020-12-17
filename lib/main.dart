import 'package:eatmeals/screens/filtermeas.dart';
import 'package:eatmeals/typeoffood.dart';
import './models/meals.dart';
import './screens/meals_details_screen.dart';
import 'package:eatmeals/screens/recipes_of_category.dart';
import 'package:flutter/material.dart';
import './screens/tab_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeal.any((meal) => meal.id == id);
  }

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];
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
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'RobotoCondensed'),
              ),
        ),
        initialRoute: '/',
        routes: {
          '/': (ctx) => TabsBar(_favoriteMeal),
          CategoryMealsScreen.routeName: (ctx) =>
              CategoryMealsScreen(_availableMeals),
          MealDetailScreen.routeName: (ctx) =>
              MealDetailScreen(_toggleFavorite, _isMealFavorite),
          FilterScreen.routeName: (ctx) => FilterScreen(_setFilters, _filters),
        },
        onGenerateRoute: (settings) {
          print(settings.arguments);
          return MaterialPageRoute(
            builder: (ctx) => CategoryMealsScreen(_availableMeals),
          );
        },
        onUnknownRoute: (settings) {
          return MaterialPageRoute(
              builder: (ctx) => CategoryMealsScreen(_availableMeals));
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
