import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/category_meals.dart';
import 'package:flutter_complete_guide/screens/meal_detail_screen.dart';
import 'screens/categories_screen.dart';
import 'screens/meal_detail_screen.dart';
import 'screens/tab_screen.dart';
import 'screens/category_meals.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(
          255,
          254,
          229,
          1,
        ),
        fontFamily: 'Raleway',
      ),
      // home: CategoriesScreen(),
      routes: {
        '/': (ctx) => TabScreen(),
        CategoryMeals.routeName: (ctx) => CategoryMeals(),
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}
