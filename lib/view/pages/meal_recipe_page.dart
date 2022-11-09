import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealRecipePage extends StatelessWidget {
  static const pageName = '/meal-recipe';
  const MealRecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    // Grab the arguments that we sent at to the page while calling
    final selectedmeal = ModalRoute.of(context)?.settings.arguments as Meal;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text(
          'Meal Recipe',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.network(
              selectedmeal.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          Text(
            "Ingredients",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: selectedmeal.ingredients
            //       .map(
            //         (ingredient) => Card(
            //           child: Text(ingredient),
            //         ),
            //       )
            //       .toList(),
            // ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    child: Text(
                      '${index + 1} . ${selectedmeal.ingredients[index]}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedmeal.ingredients.length,
              ),
            ),
          ),
          Text(
            "Steps",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headline3,
          ),
          Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(width: 3),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Card(
                    child: Text(
                      '${index + 1} . ${selectedmeal.steps[index]}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                itemCount: selectedmeal.steps.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
