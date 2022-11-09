import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../../controllers/dummy_data.dart';

class CategoryMealsPage extends StatelessWidget {
  static const String pageName = '/category-meals';

  const CategoryMealsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    // grab the arguments from the modal route
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];

    // grab the meal of the selected category (clicked category)
    final List<dynamic> selectedMeal = DUMMY_MEALS.where((meal) {
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
