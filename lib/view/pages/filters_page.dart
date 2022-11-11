import 'package:flutter/material.dart';

import '../../models/filters_data.dart';
import '../widgets/main_drawer.dart';

class FiltersPage extends StatefulWidget {
  final Function setFilters;
  final FiltersData filters;
  const FiltersPage(this.filters, this.setFilters, {super.key});

  static const String pageName = '/filters-page';

  @override
  State<FiltersPage> createState() => _FiltersPageState();
}

class _FiltersPageState extends State<FiltersPage> {
  bool? _glutenFree;
  bool? _lactoseFree;
  bool? _isVegan;
  bool? _isVegetarian;

  @override
  void initState() {
    // TODO: implement initState
    _isVegan = widget.filters.isVegan;
    _glutenFree = widget.filters.isGlutenFree;
    _isVegetarian = widget.filters.isVegetarian;
    _lactoseFree = widget.filters.isLectoseFree;
    super.initState();
  }

  Widget _builtSwitchListTile(
      String title, bool filterValue, Function updateFilters) {
    return SwitchListTile(
      value: filterValue,
      onChanged: (value) => updateFilters(value),
      title: Text(
        title,
        style: const TextStyle(fontSize: 30),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Filter'),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
            onPressed: () {
              final FiltersData filterData = FiltersData(
                isGlutenFree: _glutenFree!,
                isLectoseFree: _lactoseFree!,
                isVegan: _isVegan!,
                isVegetarian: _isVegetarian!,
              );

              widget.setFilters(filterData);
            },
            icon: const Icon(Icons.save),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 20),
            child: Center(
              child: Text(
                'Filter you meals here!',
                style: Theme.of(context).textTheme.headline6,
              ),
            ),
          ),

          // Build switch list tiles
          _builtSwitchListTile('Gloten Free', _glutenFree!, (newValue) {
            setState(() {
              _glutenFree = newValue;
            });
          }),
          _builtSwitchListTile('Lactose Free', _lactoseFree!, (newValue) {
            setState(() {
              _lactoseFree = newValue;
            });
          }),
          _builtSwitchListTile('Vegan', _isVegan!, (newValue) {
            setState(() {
              _isVegan = newValue;
            });
          }),
          _builtSwitchListTile('Vegetarian', _isVegetarian!, (newValue) {
            setState(() {
              _isVegetarian = newValue;
            });
          }),
        ],
      ),
    );
  }
}
