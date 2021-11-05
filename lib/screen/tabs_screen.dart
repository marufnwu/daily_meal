import 'package:daily_meal/screen/categories_screen.dart';
import 'package:daily_meal/screen/category_meals_screen.dart';
import 'package:daily_meal/screen/favourite_screen.dart';
import 'package:daily_meal/widget/main_drawer.dart';
import 'package:flutter/material.dart';

class TabsScreen extends StatefulWidget {


  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {

  final List<Widget> _pages = [
    const CategoriesScreen(),
    const FavouriteScreen()
  ];

  final List<String> _titles = [
    "Categories",
    "Favourite"
  ];

  int _selectedPage = 0;

  void _selectPage(int index){
      setState(() {
        _selectedPage = index;
      });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title:  Text(_titles[_selectedPage]),
          ),
          drawer: MainDrawer(),
          body: _pages[_selectedPage] ,
          bottomNavigationBar: BottomNavigationBar(
            onTap: _selectPage,
            backgroundColor: Theme.of(context).primaryColor,
            unselectedItemColor: Colors.white,
            selectedItemColor: Theme.of(context).accentColor,
            currentIndex: _selectedPage,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.category),
                  label: "Category"
              ),

              BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: "Favourite"
              ),
            ],
          ),
        )
    );
  }
}
