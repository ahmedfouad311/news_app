import 'package:flutter/material.dart';
import 'package:newsapp/home/news_details_screen.dart';
import 'package:newsapp/theme/my_theme_data.dart';

import 'home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: MyThemeData.LIGHT_THEME,
      routes: {
        HomeScreen.ROUTE_NAME: (context) => HomeScreen(),
        NewsDetailsScreen.ROUTE_NAME: (context) => NewsDetailsScreen()
      },
      initialRoute: HomeScreen.ROUTE_NAME,
    );
  }
}
