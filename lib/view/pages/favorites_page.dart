import 'package:flutter/material.dart';

import '../../models/meal.dart';

class FavoritesPage extends StatefulWidget {
  final List<Meal> favoriedMeals;
  const FavoritesPage(this.favoriedMeals, {super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Image.network(
            widget.favoriedMeals[index].imageUrl,
            fit: BoxFit.cover,
          );
        },
        itemCount: widget.favoriedMeals.length,
      ),
    );
  }
}
