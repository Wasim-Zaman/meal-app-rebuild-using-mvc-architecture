import 'package:flutter/material.dart';

import '../../models/meal.dart';

class MealItem extends StatelessWidget {
  final String mealTitle;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String imageUrl;

  const MealItem({
    required this.mealTitle,
    required this.duration,
    required this.affordability,
    required this.complexity,
    required this.imageUrl,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () {},
      child: Card(
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
                    imageUrl,
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
                      mealTitle,
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
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.watch_later_rounded,
                        color: Colors.amber,
                      ),
                      Text('$duration Min'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.work,
                        color: Colors.amber,
                      ),
                      Text('$complexity}'),
                    ],
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.monetization_on_rounded,
                        color: Colors.amber,
                      ),
                      Text('$affordability}'),
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
