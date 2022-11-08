import 'package:flutter/material.dart';

import '../../controllers/dummy_meals.dart';

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
    final selectedMeal = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    // View logic
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: ((context, index) {
          return Container(
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Theme.of(context).accentColor,
              borderRadius: BorderRadius.circular(20),
            ),
            // child: Image.network(selectedMeal[index].imageUrl),
            child: Stack(
              children: [
                Card(
                  margin: const EdgeInsets.all(10),
                  child: Image.network(
                    selectedMeal[index].imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 10,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.1,
                    width: MediaQuery.of(context).size.width * 0.5,
                    color: Colors.black54,
                    child: Text(
                      selectedMeal[index].title,
                      softWrap: true,
                      style: const TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }),
        itemCount: selectedMeal.length,
      ),
    );
  }
}
