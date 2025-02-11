import 'package:news_app/news/data/data_source.dart';
import 'package:news_app/news/models/news.dart';

class NewsRepository {
  final NewsDataSource newsDataSource;
  NewsRepository({
    required this.newsDataSource
  });

  Future<List<NewsModel>> getNews() async {
    final news = await newsDataSource.readDataFromAllSources();
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