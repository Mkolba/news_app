import 'news.dart';

class NewsApi2Model implements NewsModel {
  final String datetime;
  final String main;
  final String article;
  final String author;
  final bool rawPopular;
  final String source;

  NewsApi2Model({
    required this.datetime,
    required this.main,
    required this.article,
    required this.author,
    required this.rawPopular,
    required this.source,
  });

  factory NewsApi2Model.fromJson(Map<String, dynamic> json) {
    return NewsApi2Model(
      datetime: json['datetime'],
      main: json['main'],
      article: json['article'],
      author: json['author'],
      rawPopular: json.containsKey('isPopular') ? json['isPopular'] : false,
      source: json['source'],
    );
  }

  @override
  DateTime get date => DateTime.parse(datetime);

  @override
  String get title => main;

  @override
  String get description => article;

  @override
  bool get isPopular => rawPopular;
}
