// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:newsapp/home/category_item.dart';

class CategoriesScreen extends StatelessWidget {
  Function onCategoryClickToHomeScreen;
  List<Category> categories = [
    Category('sports', 'Sports', 'assets/images/ball.png',
        Color.fromARGB(255, 201, 28, 34)),
    Category('general', 'Politics', 'assets/images/Politics.png',
        Color.fromARGB(255, 0, 62, 144)),
    Category('health', 'Health', 'assets/images/health.png',
        Color.fromARGB(255, 237, 30, 121)),
    Category('business', 'Bussines', 'assets/images/bussines.png',
        Color.fromARGB(255, 207, 126, 72)),
    Category('general', 'Environment', 'assets/images/environment.png',
        Color.fromARGB(255, 72, 130, 207)),
    Category('science', 'Science', 'assets/images/science.png',
        Color.fromARGB(255, 242, 211, 82)),
  ];

  CategoriesScreen(this.onCategoryClickToHomeScreen);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              'Pick Your Category \nof interest',
              style: Theme
                  .of(context)
                  .textTheme
                  .headline4!
                  .copyWith(
                  color: Colors.black,
                  fontWeight: FontWeight.normal
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: (context, index) {
                return CategoryItem(categories[index], index,
                        (category) {
                      onCategoryClickToHomeScreen(category);
                    }
                );
              },
              itemCount: categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
