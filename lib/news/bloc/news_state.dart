part of 'news_bloc.dart';

final class NewsState extends Equatable {
  const NewsState({
    this.status = RequestStatus.initial,
    this.news = const <NewsModel>[]
  });

  final RequestStatus status;
  final List<NewsModel> news;

  NewsState copyWith({
    RequestStatus? status,
    List<NewsModel>? news,
  }) {
    return NewsState(
      status: status ?? this.status,
      news: news ?? this.news,
    );
  }

  @override
  List<Object> get props => [status, news];
}