import 'package:flutter/material.dart';

class MealRecipePage extends StatelessWidget {
  static const pageName = '/meal-recipe';
  const MealRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          '',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
    );
  }
}
