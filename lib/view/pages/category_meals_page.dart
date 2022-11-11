import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../../models/meal.dart';

class CategoryMealsPage extends StatefulWidget {
  static const String pageName = '/category-meals';

  final List<Meal> availableMeals;

  const CategoryMealsPage(this.availableMeals, {super.key});

  @override
  State<CategoryMealsPage> createState() => _CategoryMealsPageState();
}

class _CategoryMealsPageState extends State<CategoryMealsPage> {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // grab the arguments from the modal route
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];

    // grab the meal of the selected category (clicked category)
    final List<dynamic> selectedMeal = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    // View logic

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          categoryTitle,
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return MealItem(
            selectedMeal: selectedMeal[index],
          );
        }),
        itemCount: selectedMeal.length,
      ),
    );
  }
}
