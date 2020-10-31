import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/category_meals.dart';
import './categories_screen.dart';
import './category_meals.dart';

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
      home: CategoriesScreen(),
      routes: {
        '/category-meals': (ctx) => CategoryMeals(),
      },
    );
  }
}
