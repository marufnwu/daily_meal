import 'package:daily_meal/screen/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

  // void selectCategory(BuildContext context){
  //   Navigator.of(context).push(MaterialPageRoute(
  //       builder: (_)  {
  //         return CategoryMealsScreen(id, title);
  //       },
  //     )
  //   );
  // }

  void selectCategory(BuildContext context){
    Navigator.of(context).pushNamed(
        CategoryMealsScreen.ROUTE_NAME,
        arguments: {"id": id, "title": title}
    );
  }



  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:() => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title, style: Theme.of(context).textTheme.subtitle1),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(.7),
                color
                ],
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft
            ),
          borderRadius: BorderRadius.circular(15),

        ),
      ),
    );
  }
}
