import 'package:flutter/material.dart';
import 'package:newsapp/data/news_response.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetailsScreen extends StatelessWidget {
  static const String ROUTE_NAME = 'News Details Screen';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
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
                news.sources?.name ?? '',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
              centerTitle: true,
            ),
          ),
          body: Container(
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
                  height: 5,
                ),
                Text(
                  news.publishedAt ?? "",
                  textAlign: TextAlign.end,
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 35, horizontal: 10),
                  padding: EdgeInsets.all(12),
                  child: Text(
                    news.content ?? '',
                    maxLines: 13,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {
                    launchURL(news.url ?? '');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'View Full Article',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.arrow_right),
                      ],
                    ),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
