import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  Category category;
  int index;
  Function onCategoryClick;

  CategoryItem(this.category, this.index, this.onCategoryClick);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onCategoryClick(category);
      },
      child: Container(
        decoration: BoxDecoration(
          color: category.backgroundColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
            bottomRight: Radius.circular(index % 2 == 0 ? 0 : 24),
            bottomLeft: Radius.circular(index % 2 == 0 ? 24 : 0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                category.imagePath,
              ),
              height: 120,
            ),
            Text(
              category.title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ],
        ),
      ),
    );
  }
}

class Category {
  String id;
  String title;
  String imagePath;
  Color backgroundColor;

  Category(this.id, this.title, this.imagePath, this.backgroundColor);
}
