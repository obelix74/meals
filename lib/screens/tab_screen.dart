import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/screens/favorites_screen.dart';
import './categories_screen.dart';

import 'package:flutter_complete_guide/screens/categories_screen.dart';

class TabScreen extends StatefulWidget {
  TabScreen({Key key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.category), text: 'Categories'),
              Tab(icon: Icon(Icons.star), text: 'Favorites'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}
