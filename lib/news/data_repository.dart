import 'dart:convert';
import 'dart:js_interop';

import 'package:news_app/news/data_provider.dart';
import 'package:news_app/news/models/news.dart';

class NewsRepository {
  NewsRepository({NewsProvider? newsProvider}) : _newsProvider = newsProvider ?? NewsProvider();

  final NewsProvider _newsProvider;

  Future<List<News>> getNews() async {
    final news = await _newsProvider.readDataFromAllSources();
    news.sort((a, b) {
      if (a.isPopular && !b.isPopular) {
        return -1;
      } else if (!a.isPopular && b.isPopular) {
        return 1;
      } else {
        return -a.date.compareTo(b.date);
      }
    });
    return news;
  }
}