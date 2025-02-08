import 'package:bloc/bloc.dart';
import 'package:news_app/news/data_repository.dart';
import 'package:news_app/news/models/news.dart';
import 'package:equatable/equatable.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  NewsBloc({required this.newsRepository}) : super(const NewsState()) {
    on<NewsFetched>(_onFetched);
  }

  Future<void> _onFetched(NewsFetched event, Emitter<NewsState> emit) async {
    try {
      final news = await newsRepository.getNews();
      emit(
        state.copyWith(
          status: NewsStatus.success,
          news: news
        )
      );
    } catch (e) {
      emit(state.copyWith(status: NewsStatus.failure));
      print(e);
    }
  }

  final NewsRepository newsRepository;
}