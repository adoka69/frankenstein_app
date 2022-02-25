import 'package:flutter/material.dart';
import 'package:frankapp/models/meal.dart';
import 'package:frankapp/screens/widgets/meal_item.dart';

class FavoritesScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen(this.favoriteMeals);

  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    if (widget.favoriteMeals.isEmpty) {
      return Center(
        child: Text("Empty!"),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, i) => MealItem(
          meal: widget.favoriteMeals[i],
        ),
        itemCount: widget.favoriteMeals.length,
      );
    }
  }
}
