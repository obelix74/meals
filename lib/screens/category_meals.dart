import 'package:flutter/material.dart';
import './../models/dummy_data.dart';
import './../widgets/meal_item.dart';

class CategoryMeals extends StatelessWidget {
  static const routeName = '/category-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMeals(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var categoryMeal = categoryMeals[index];
          return MealItem(
            title: categoryMeal.title,
            imageUrl: categoryMeal.imageUrl,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
            duration: categoryMeal.duration,
          );
        },
        itemCount: categoryMeals.length,
      ),
    );
  }
}
