import 'package:daily_meal/dummy_data.dart';
import 'package:daily_meal/widget/meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const ROUTE_NAME = "/category-meals";

  // final String categoryId;
  // final String categoryTitle;
  //
  //
  // CategoryMealsScreen(this.categoryId, this.categoryTitle);
  @override
  Widget build(BuildContext context) {

    final routeArg  = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final String categoryTitle = routeArg['title']!;
    final String categoryId = routeArg['id']!;
    final categoryMeals = DUMMY_MEALS.where((element) {
      return element.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index){
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            affordability: categoryMeals[index].affordability,
            complexity: categoryMeals[index].complexity,
            duration: categoryMeals[index].duration,
            imageUrl: categoryMeals[index].imageUrl,
          );
        },
        itemCount: categoryMeals.length,)
    );
  }
}
