import 'package:flutter/material.dart';
import 'package:newsapp/data/news_response.dart';
import 'package:newsapp/home/news_details_screen.dart';

class NewsItemWidget extends StatelessWidget {
  News news;

  NewsItemWidget(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetailsScreen.ROUTE_NAME,
            arguments: news);
      },
      child: Container(
        margin: EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                child: Image.network(
                  news.urlToImage ?? "",
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              news.sources?.name ?? " ",
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              news.title ?? "",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              news.publishedAt ?? "",
              textAlign: TextAlign.end,
            ),
          ],
        ),
      ),
    );
  }
}
