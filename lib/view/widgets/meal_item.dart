import 'package:flutter/material.dart';

import '../pages/meal_recipe_page.dart';

import '../../models/meal.dart';

class MealItem extends StatelessWidget {
  final Meal selectedMeal;

  const MealItem({
    required this.selectedMeal,
    Key? key,
  }) : super(key: key);

  // A controller for the selected meal after tapping
  void selectMeal(BuildContext context) {
    Navigator.of(context).pushNamed(
      MealRecipePage.pageName,
      arguments: selectedMeal,
    );
  }

  // Creating two string getters for complexity and affordability
  String get strAffordability {
    switch (selectedMeal.affordability) {
      case Affordability.affordable:
        return "Affordable";

      case Affordability.luxurious:
        return "Luxurious";

      case Affordability.pricey:
        return "Pricey";

      default:
        return "Unknown";
    }
  }

  // For complexity
  String get strComplexity {
    switch (selectedMeal.complexity) {
      case Complexity.challenging:
        return "Challenging";

      case Complexity.hard:
        return "Hard";

      case Complexity.simple:
        return "Simple";

      default:
        return "Unknown";
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        // color: categoryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(13),
                    topRight: Radius.circular(13),
                  ),
                  child: Image.network(
                    selectedMeal.imageUrl,
                    height: MediaQuery.of(context).size.height * 0.3,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 1,
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.10,
                    width: MediaQuery.of(context).size.width * 0.6,
                    alignment: Alignment.center,
                    color: Colors.black54,
                    child: Text(
                      selectedMeal.title,
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
            Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_outlined,
                        color: Colors.purple,
                      ),
                      Text('${selectedMeal.duration} Min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work_outline,
                        color: Colors.purple,
                      ),
                      Text(strComplexity),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.attach_money,
                        color: Colors.purple,
                      ),
                      Text(strAffordability),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
