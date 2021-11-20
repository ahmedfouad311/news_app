import 'package:flutter/material.dart';
import 'package:newsapp/home/categories_screen.dart';
import 'package:newsapp/home/category_details_screen.dart';
import 'package:newsapp/home/category_item.dart';

class HomeScreen extends StatefulWidget {
  static const String ROUTE_NAME = 'Home Screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: Image(
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.fill,
            image: AssetImage('assets/images/pattern.png'),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(70.0),
            child: AppBar(
              shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(bottom: Radius.circular(30))),
              title: Text(
                'News Application',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              centerTitle: true,
            ),
          ),
          drawer: Drawer(
            child: Container(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30),
                      ),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 48),
                    width: double.infinity,
                    child: Text(
                      'News App',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline4,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      setState(() {
                        selectedCategory = null;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.list,
                            size: 36,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Categories',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Icon(
                          Icons.settings,
                          size: 36,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Settings',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: selectedCategory == null
              ? CategoriesScreen(onCategoryClickFromCategoriesScreen)
              : CategoryDetailsScreen(selectedCategory!),
        ),
      ],
    );
  }

  Category? selectedCategory = null;

  void onCategoryClickFromCategoriesScreen(Category category) {
    print(category.title);
    setState(() {
      selectedCategory = category;
    });
  }
}
