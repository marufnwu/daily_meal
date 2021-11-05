import 'package:daily_meal/screen/filters_sceen.dart';
import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.center,
            color: Theme.of(context).accentColor,
            child: Text("Cooking Up! ", style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: Theme.of(context).primaryColor
            ),
            ),
          ),
          const SizedBox(height: 20,),
          buildListTile(
              "Meal",
              Icons.restaurant,
              (){
                Navigator.of(context).pushNamed("/");
              }
          ),
          buildListTile(
              "Filters",
              Icons.settings,
              (){
                Navigator.of(context).pushNamed(FilterScreen.ROUTE_NAME);
              }
          ),
        ],
      ),
    );
  }

  ListTile buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
          leading: Icon(
            icon,
            size: 25,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontFamily: 'RobotoCondensed',
              fontSize: 24,
              fontWeight: FontWeight.bold
            ),
          ),
          onTap: tapHandler(),
        );
  }
}
