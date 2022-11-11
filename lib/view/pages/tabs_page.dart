import 'package:flutter/material.dart';

import '../pages/categories_page.dart';
import '../pages/favorites_page.dart';

import '../widgets/main_drawer.dart';

import '../../models/meal.dart';

class TabsPage extends StatelessWidget {
  final List<Meal> favoritedMeals;
  const TabsPage(this.favoritedMeals, {super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text('Meal App'),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: "Categories",
                icon: Icon(Icons.category),
              ),
              Tab(
                text: "Favorites",
                icon: Icon(Icons.favorite),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const CategoriesPage(),
            FavoritesPage(favoritedMeals),
          ],
        ),
        drawer: const MainDrawer(),
      ),
    );
  }
}
