import 'package:flutter/material.dart';
import 'package:newsapp/data/API_manager.dart';
import 'package:newsapp/data/sources_response.dart';
import 'package:newsapp/home/category_item.dart';
import 'package:newsapp/home/category_tabs_widget.dart';

class CategoryDetailsScreen extends StatelessWidget {
  Category category;

  CategoryDetailsScreen(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: FutureBuilder<SourcesResponse>(
        future: ApiManager.loadNewsSources(category.id),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return CategoryTabsWidget(snapshot.data?.sources ?? []);
        },
      ),
    );
  }
}
