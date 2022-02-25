import 'package:flutter/material.dart';
import 'package:frankapp/models/meal.dart';
import 'package:frankapp/screens/meal_details_screen.dart';

class MealItem extends StatelessWidget {
  final Meal meal;

  const MealItem({@required this.meal});

  void _selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: meal.id).then((result) {
      if (result != null) {
        // do something
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: const Radius.circular(15),
                    topRight: const Radius.circular(15),
                  ),
                  child: Image.network(meal.imageUrl, width: double.infinity, height: 250, fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20.0),
                    color: Colors.black54,
                    child: Text(
                      meal.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.schedule),
                      const SizedBox(width: 6),
                      Text("${meal.duration} min"),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.work),
                      const SizedBox(width: 6),
                      Text(meal.complexity.toText()),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.attach_money),
                      const SizedBox(width: 6),
                      Text(meal.affordability.toText()),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
