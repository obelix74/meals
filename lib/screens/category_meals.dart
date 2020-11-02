import 'package:flutter/material.dart';
import './../models/dummy_data.dart';
import './../widgets/meal_item.dart';
import './../models/meal.dart';

class CategoryMeals extends StatefulWidget {
  static const routeName = '/category-meals';

  @override
  _CategoryMealsState createState() => _CategoryMealsState();
}

class _CategoryMealsState extends State<CategoryMeals> {
  String categoryTitle;
  List<Meal> displayedMeals;
  bool _loadedInitData = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = DUMMY_MEALS.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          var categoryMeal = displayedMeals[index];
          return MealItem(
            id: categoryMeal.id,
            title: categoryMeal.title,
            imageUrl: categoryMeal.imageUrl,
            complexity: categoryMeal.complexity,
            affordability: categoryMeal.affordability,
            duration: categoryMeal.duration,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
