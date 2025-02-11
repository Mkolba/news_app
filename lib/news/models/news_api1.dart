import 'news.dart';

class NewsApi1Model implements NewsModel {
  final int rawDate;
  final String title;
  final String description;
  final String author;
  final bool hot;
  final String site;

  NewsApi1Model({
    required this.rawDate,
    required this.title,
    required this.description,
    required this.author,
    required this.hot,
    required this.site,
  });

  factory NewsApi1Model.fromJson(Map<String, dynamic> json) {
    return NewsApi1Model(
      rawDate: json['date'],
      title: json['title'],
      description: json['description'],
      author: json['author'],
      hot: json['hot'],
      site: json['site'],
    );
  }

  @override
  DateTime get date => DateTime.fromMillisecondsSinceEpoch(rawDate);

  @override
  bool get isPopular => hot;

  @override
  String get source => site;
}