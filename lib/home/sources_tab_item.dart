import 'package:flutter/material.dart';
import 'package:newsapp/data/sources_response.dart';

class SourcesTabItem extends StatelessWidget {
  Sources sources;
  bool isSelected;

  SourcesTabItem(this.sources, this.isSelected);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 7, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color:
              isSelected ? Theme.of(context).primaryColor : Colors.transparent,
          border: Border.all(
            color: Theme.of(context).primaryColor,
            width: 2,
          )),
      child: Text(
        sources.name ?? "",
        style: TextStyle(
          color: isSelected ? Colors.white : Theme.of(context).primaryColor,
        ),
      ),
    );
  }
}
