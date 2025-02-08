class NewsFromFirstSource {
  final int date;
  final String title;
  final String description;
  final String author;
  final bool hot;
  final String site;

  NewsFromFirstSource({
    required this.date,
    required this.title,
    required this.description,
    required this.author,
    required this.hot,
    required this.site,
  });

  factory NewsFromFirstSource.fromJson(Map<String, dynamic> json) {
    return NewsFromFirstSource(
        date: (json['date'] as num).toInt(),
        title: json['title'],
        description: json['description'],
        author: json['author'],
        hot: json['hot'],
        site: json['site']
    );
  }
}