enum Complexity {
  simple,
  challenging,
  hard,
}

enum Affordability {
  affordable,
  pricey,
  luxurious,
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  bool isFavorite;

  Meal({
    required this.id,
    required this.isVegetarian,
    required this.affordability,
    required this.categories,
    required this.complexity,
    required this.duration,
    required this.imageUrl,
    required this.ingredients,
    required this.isGlutenFree,
    required this.isLactoseFree,
    required this.isVegan,
    required this.steps,
    required this.title,
    this.isFavorite = false,
  });
}
