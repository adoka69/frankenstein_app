import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frankapp/data/dummy_data.dart';
import 'package:frankapp/models/meal.dart';
import 'package:frankapp/screens/category_meals_screen.dart';
import 'package:frankapp/screens/filters_screen.dart';
import 'package:frankapp/screens/meal_details_screen.dart';
import 'package:frankapp/screens/tabs_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  static const routeName = "/";

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

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

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

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final index = _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (index >= 0) {
      setState(() {
        _favoriteMeals.removeAt(index);
      });
    } else {
      setState(() {
        _favoriteMeals.add(_availableMeals.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: "Raleway",
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            bodyText2: TextStyle(
              color: Color.fromRGBO(20, 51, 51, 1),
            ),
            subtitle1: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: "RobotoCondensed",
            )),
      ),
      initialRoute: MyApp.routeName,
      routes: {
        MyApp.routeName: (ctx) => TabsScreen(_favoriteMeals),
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toggleFavorite, _isMealFavorite),
        FiltersScreen.routeName: (ctx) => FiltersScreen(_filters, _setFilters),
      },
//      onGenerateRoute: (RouteSettings settings) {
//        switch (settings.name) {
//          case MyApp.routeName:
//            return ((context) => TabsScreen();
//          case CategoryMealsScreen.routeName:
//            return MaterialPageRoute(builder: (_) => CategoryMealsScreen(), settings: settings);
//          case MealDetailsScreen.routeName:
//            return CupertinoPageRoute(builder: (_) => MealDetailsScreen(), settings: settings);
//        }
//
//        return MaterialPageRoute(builder: (_) => CategoriesScreen());
//      },
    );
  }
}
