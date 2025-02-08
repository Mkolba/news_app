class NewsFromSecondSource {
  final String datetime;
  final String main;
  final String article;
  final String author;
  final bool isPopular;
  final String source;

  const NewsFromSecondSource({
    required this.datetime,
    required this.main,
    required this.article,
    required this.author,
    this.isPopular = false,
    required this.source,
  });

  factory NewsFromSecondSource.fromJson(Map<String, dynamic> json) {
    return NewsFromSecondSource(
        datetime: json['datetime'],
        main: json['main'],
        article: json['article'],
        author: json['author'],
        source: json['source']
    );
  }
}