import 'package:flutter/material.dart';
import 'package:frankapp/main.dart';
import 'package:frankapp/screens/filters_screen.dart';
import 'package:frankapp/clima/screens/location_screen.dart';
import 'package:frankapp/calc/calc.dart';
class MainDrawer extends StatelessWidget {
  Widget _buildListTile(String title, IconData icon, Function onClick) {
    return ListTile(
      leading: Icon(icon, size: 26),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: "RobotoCondensed",
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: onClick,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            color: Theme.of(context).primaryColor,
            height: 120,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking Up!",
              style: TextStyle(
                fontWeight: FontWeight.w900,
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          const SizedBox(height: 20),
          _buildListTile("Meals", Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed(MyApp.routeName);
          }),
          _buildListTile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
          ElevatedButton(
            child: const Text('Open clima'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  LocationScreen()),
              );
            },
          ),
          ElevatedButton(
            child: const Text('Open calc'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) =>  Calculator()),
              );
            },
          ),
        ],
      ),
    );
  }
}
