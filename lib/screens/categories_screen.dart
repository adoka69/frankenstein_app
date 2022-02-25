import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:frankapp/data/dummy_data.dart';

import 'widgets/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const CategoryGridView(),
    );
  }
}

class CategoryGridView extends StatelessWidget {
  const CategoryGridView();

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(15),
      children: <Widget>[
        ...DUMMY_CATEGORIES
            .map((it) => CategoryItem(
                  it.id,
                  it.title,
                  it.color,
                ))
            .toList()
      ],
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
