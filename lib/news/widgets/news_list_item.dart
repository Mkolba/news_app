import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/news.dart';

DateFormat dateFormat = DateFormat("dd.MM.yyyy в HH:MM");

class NewsListItem extends StatelessWidget {
  const NewsListItem({required this.news, super.key});
  final News news;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
              trailing: news.isPopular ? Icon(Icons.whatshot, color: Color(0xFFF19E39)) : null,
              title: Text(news.title),
              subtitle: Text(news.description, maxLines: 2),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('Published by ${news.author}'),
                    Text('Source: ${news.source}'),
                  ],
                ),
                Text(dateFormat.format(news.date), style: TextStyle(fontSize: 14))
              ],
            )
          )
        ],
      )
    );
  }
}