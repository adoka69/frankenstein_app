import 'package:flutter/material.dart';
import 'package:frankapp/data/dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = "/meal-details";

  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetailsScreen(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);

    Widget _buildSectionTitle(String msg) {
      return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Text(msg, style: Theme.of(context).textTheme.subtitle1),
      );
    }

    Widget _buildContainer(Widget listView) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        width: 300,
        height: 150,
        child: listView,
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text(selectedMeal.title)),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _buildSectionTitle("Ingredients"),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Card(
                color: Theme.of(context).accentColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: Text(selectedMeal.ingredients[index]),
                ),
              ),
              itemCount: selectedMeal.ingredients.length,
            )),
            _buildSectionTitle("Steps"),
            _buildContainer(ListView.builder(
              itemBuilder: (ctx, index) => Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      child: Text("${index + 1}"),
                    ),
                    title: Text(
                      selectedMeal.steps[index],
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: selectedMeal.steps.length,
            ))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
        onPressed: () => toggleFavorite(mealId),
      ),
    );
  }
}
