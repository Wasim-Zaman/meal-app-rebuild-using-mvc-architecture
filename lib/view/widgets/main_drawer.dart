import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            decoration: BoxDecoration(
              color: Theme.of(context).accentColor,
              border: Border.all(width: 4),
            ),
            child: Center(
                child: Text(
              'Warm Meal!',
              style: Theme.of(context).textTheme.headline3,
            )),
          )
        ],
      ),
    );
  }
}
