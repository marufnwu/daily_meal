import 'package:daily_meal/screen/categories_screen.dart';
import 'package:daily_meal/screen/category_meals_screen.dart';
import 'package:daily_meal/screen/favourite_screen.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Meals"),
            bottom: const TabBar(
                tabs: [
                  Tab(
                    icon: Icon (Icons.category),
                    text: 'Category',
                  ),
                  Tab(
                    icon: Icon (Icons.star),
                    text: 'Favourite',
                  )
                ]
            ),
          ),
          body: const TabBarView(
            children: [
              CategoriesScreen(),
              FavouriteScreen()
            ],
          ),
        )
    );
  }
}
