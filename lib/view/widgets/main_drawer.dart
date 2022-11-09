import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  void switchPage(BuildContext context) {}

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).accentColor,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(13),
                bottomRight: Radius.circular(13),
              ),
            ),
            child: Center(
              child: Text(
                'Warm Meal!',
                style: Theme.of(context).textTheme.headline3,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ListTile(
            leading: const Icon(
              Icons.food_bank_outlined,
              size: 50,
            ),
            title: const Text(
              'Meals',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            onTap: () {
              switchPage(context);
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.05,
          ),
          ListTile(
            leading: const Icon(
              Icons.filter,
              size: 50,
            ),
            title: const Text(
              'Filters',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
            onTap: () {
              switchPage(context);
            },
          ),
        ],
      ),
    );
  }
}
