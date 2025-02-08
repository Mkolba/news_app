part of 'news_bloc.dart';

enum NewsStatus { initial, success, failure }

final class NewsState extends Equatable {
  const NewsState({
    this.status = NewsStatus.initial,
    this.news = const <News>[]
  });

  final NewsStatus status;
  final List<News> news;

  NewsState copyWith({
    NewsStatus? status,
    List<News>? news,
    bool? hasReachedMax,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  List<Object> get props => [status, news];
}