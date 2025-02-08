import 'news_from_first_source.dart';
import 'news_from_second_source.dart';

class News {
  final String title;
  final String description;
  final String author;
  final DateTime date;
  final bool isPopular;
  final String source;

  News({
    required this.title,
    required this.description,
    required this.author,
    required this.date,
    required this.isPopular,
    required this.source,
  });

  factory News.fromJson(Map<String, dynamic> json) {
    if (json.containsKey('date')) {
      var data = NewsFromFirstSource.fromJson(json);
      return News(
        title: data.title,
        description: data.description,
        author: data.author,
        date: DateTime.fromMillisecondsSinceEpoch(data.date),
        isPopular: data.hot,
        source: data.site,
      );
    } else if (json.containsKey('datetime')) {
      var data = NewsFromSecondSource.fromJson(json);
      return News(
        title: data.main,
        description: data.article,
        author: data.author,
        date: DateTime.parse(data.datetime),
        isPopular: data.isPopular,
        source: data.source,
      );
    } else {
      throw Exception("Invalid JSON");
    }
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic> {
      'title': title,
      'description': description,
      'author': author,
      'date': date,
      'is_popular': isPopular,
      'source': source
    };
  }
}
