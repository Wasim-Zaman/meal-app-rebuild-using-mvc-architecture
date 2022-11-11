import 'package:flutter/material.dart';
import 'package:meal_application_revised/controllers/dummy_data.dart';

import 'view/pages/category_meals_page.dart';
import 'view/pages/meal_recipe_page.dart';
import 'view/pages/categories_page.dart';
import 'view/pages/filters_page.dart';
import 'view/pages/tabs_page.dart';

import 'view/themes/theme_style.dart';

import './models/filters_data.dart';
import './models/meal.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variables or Attributes
  List<Meal> _availableMeals = DUMMY_MEALS;
  final List<Meal> _favoritedMeals = [];
  FiltersData _filtersData = FiltersData();

  // Methods
  void _setFilters(FiltersData filtersData) {
    setState(() {
      _filtersData = filtersData;
    });

    // Setting up the available meal here.
    _availableMeals = DUMMY_MEALS.where((meal) {
      if (_filtersData.isGlutenFree && !meal.isGlutenFree) {
        return false;
      }
      if (_filtersData.isLectoseFree && !meal.isLactoseFree) {
        return false;
      }
      if (_filtersData.isVegan && !meal.isVegan) {
        return false;
      }
      if (_filtersData.isVegetarian && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
  }

  // Set favorites attribute using method
  void toggleFavorites(Meal meal) {
    // If a meal is already favorite, make it un-favorite
    if (_favoritedMeals.contains(meal)) {
      setState(() {
        _favoritedMeals.removeWhere((meal) {
          return true;
        });
      });
    }

    // If a meal is not favorite, then make it favorite
    else {
      setState(() {
        _favoritedMeals.add(meal);
      });
    }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal App",
      debugShowCheckedModeBanner: false,
      theme: themeStyle(),
      darkTheme: ThemeData.dark(),

      // home: const CategoriesPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => TabsPage(_favoritedMeals),
        CategoryMealsPage.pageName: (context) =>
            CategoryMealsPage(_availableMeals),
        MealRecipePage.pageName: (context) => MealRecipePage(toggleFavorites),
        CategoriesPage.pageName: (context) => const CategoriesPage(),
        FiltersPage.pageName: (context) => FiltersPage(
              _filtersData,
              _setFilters,
            ),
      },
    );
  }
}
