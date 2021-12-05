import 'package:flutter/material.dart';
import 'package:newsapp/data/API_manager.dart';
import 'package:newsapp/data/news_response.dart';
import 'package:newsapp/home/categories_screen.dart';
import 'package:newsapp/home/category_details_screen.dart';
import 'package:newsapp/home/category_item.dart';
import 'package:newsapp/home/news_item_widget.dart';

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
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News Application',
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      showSearch(context: context, delegate: NewsSearch());
                    },
                    icon: Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                  ),
                ],
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
                      color: Theme
                          .of(context)
                          .primaryColor,
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
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4,
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
                            style: Theme
                                .of(context)
                                .textTheme
                                .headline6,
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
                          style: Theme
                              .of(context)
                              .textTheme
                              .headline6,
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

class NewsSearch extends SearchDelegate {
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      inputDecorationTheme: InputDecorationTheme(
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: Colors.green,
      ),
      appBarTheme: AppBarTheme(
        elevation: 0,
        color: Colors.transparent,
        //app bar color I wanted
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          ApiManager.loadNewsDetails(query: query);
          // de build in function goa el delegate kol wazeftha 2nha hat3ml call le el function el ta7t el 2smaha buildResults
          showResults(context);
        },
        icon: Icon(
          Icons.search,
          color: Theme
              .of(context)
              .primaryColor,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: Icon(
        Icons.clear,
        color: Theme
            .of(context)
            .primaryColor,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder<NewsResponse>(
      future: ApiManager.loadNewsDetails(query: query),
      builder: (context, snapShot) {
        if (snapShot.hasError) {
          return Center(child: Text(snapShot.error.toString()));
        }
        else if (snapShot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemBuilder: (context, index) {
            return NewsItemWidget(snapShot.data!.articles!.elementAt(index));
          },
          itemCount: snapShot.data?.articles?.length ?? 0,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
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
            body: Container(
                color: Colors.transparent
            ),
          ),
        ]
    );
  }

}
