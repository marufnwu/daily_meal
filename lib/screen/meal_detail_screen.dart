import 'package:daily_meal/dummy_data.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const ROUTE_NAME = "/meal-details";
  @override
  Widget build(BuildContext context) {
    final String mealId = ModalRoute.of(context)!.settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere(
            (element) => element.id == mealId
    );
    return Scaffold(
      appBar: AppBar(
        title:  Text(selectedMeal.title),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 280,
              width: double.infinity,
              child: Image.network(
                  selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingredients"),
             buildContainer(ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10
                      ),
                      child: Text(selectedMeal.ingredients[index])
                    ),
                  ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            buildContainer(
              ListView.builder(
                  itemBuilder: (ctx, index)=>Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(child: Text('# ${index+1}')),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider()
                    ],

                  ),
                itemCount: selectedMeal.steps.length,
              )
            )
          ],
        ),
      ),
    );
  }

  Container buildSectionTitle(BuildContext context, String title) {
    return Container(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child:  Text(
            title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
        );
  }

  Container buildContainer(Widget child){
    return Container(
        decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey,  ),
    borderRadius: BorderRadius.circular(10)
    ),
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.all(10),
    height: 200, width: 300,
    child: child
    );
  }
}
