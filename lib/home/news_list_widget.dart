import 'package:flutter/material.dart';
import 'package:newsapp/data/API_manager.dart';
import 'package:newsapp/data/news_response.dart';
import 'package:newsapp/data/sources_response.dart';
import 'package:newsapp/home/news_item_widget.dart';

class NewsListWidget extends StatelessWidget {
  Sources? sources;
  String? query; // 3l4an el search
  NewsListWidget({this.sources, this.query});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FutureBuilder<NewsResponse>(
        future: ApiManager.loadNewsDetails(sources: sources?.id, query: query),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              return NewsItemWidget(snapshot.data!.articles!.elementAt(index));
            },
            itemCount: snapshot.data?.articles?.length ?? 0,
          );
        },
      ),
    );
  }
}
