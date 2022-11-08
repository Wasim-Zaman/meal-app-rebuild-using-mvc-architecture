import 'package:flutter/material.dart';

import 'view/pages/category_meals_page.dart';
import 'view/pages/categories_page.dart';

import 'view/themes/theme_style.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Meal App",
      theme: themeStyle(),
      // home: const CategoriesPage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoriesPage(),
        CategoryMealsPage.pageName: (context) => const CategoryMealsPage(),
      },
    );
  }
}