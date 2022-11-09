import 'package:flutter/material.dart';

import '../pages/category_meals_page.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;
  const CategoryItem(
    this.id,
    this.title,
    this.color, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).accentColor,
      onTap: () {
        Navigator.of(context).pushNamed(
          CategoryMealsPage.pageName,
          arguments: {
            'id': id,
            'title': title,
            'color': color,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(13),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.6),
              color,
            ],
          ),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline4,
        ),
      ),
    );
  }
}
