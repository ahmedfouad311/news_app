import 'package:flutter/material.dart';
import 'package:newsapp/data/sources_response.dart';
import 'package:newsapp/home/news_list_widget.dart';
import 'package:newsapp/home/sources_tab_item.dart';

class CategoryTabsWidget extends StatefulWidget {
  // bt3red el tab el gaya mn el api
  List<Sources> sources;

  CategoryTabsWidget(this.sources);

  @override
  State<CategoryTabsWidget> createState() => _CategoryTabsWidgetState();
}

class _CategoryTabsWidgetState extends State<CategoryTabsWidget> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: DefaultTabController(
        initialIndex: 0,
        length: widget.sources.length,
        child: Column(
          children: [
            TabBar(
              padding: EdgeInsets.only(top: 25, bottom: 10, left: 4, right: 4),
              onTap: (index) {
                selectedTab = index;
                setState(() {});
              },
              indicatorColor: Colors.transparent,
              isScrollable: true,
              // el map: hna ba3ml convert el list of sources de le list of widget 3l4an 22dar 23redha
              tabs: widget.sources
                  .map((element) => SourcesTabItem(
                      element, selectedTab == widget.sources.indexOf(element)))
                  .toList(),
            ),
            NewsListWidget(
              sources: widget.sources[selectedTab],
              // query: "flutter" dah el search
            ),
          ],
        ),
      ),
    );
  }
}
