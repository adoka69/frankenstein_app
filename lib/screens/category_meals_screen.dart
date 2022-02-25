import 'package:flutter/material.dart';
import 'package:frankapp/models/meal.dart';
import 'package:frankapp/screens/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = "/category-meals";

  final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      final categoryId = routeArgs["id"];
      categoryTitle = routeArgs["title"];
      displayedMeals = widget.availableMeals.where((meal) => meal.categories.contains(categoryId)).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(categoryTitle)),
      body: ListView.builder(
        itemBuilder: (ctx, i) => MealItem(
          meal: displayedMeals[i],
        ),
        itemCount: displayedMeals.length,
      ),
    );
  }
}
