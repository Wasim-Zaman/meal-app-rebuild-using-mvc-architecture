import 'package:flutter/material.dart';

import '../widgets/category_item.dart';
import '../../controllers/dummy_data.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 250,
          // childAspectRatio: 3 / 2,
          crossAxisSpacing: 25,
          mainAxisSpacing: 25,
        ),
        children: DUMMY_CATEGORIES
            .map(
              (category) =>
                  CategoryItem(category.id, category.title, category.color),
            )
            .toList(),
      ),
    );
  }
}
