import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:news_app/news/data/data_repository.dart';
import '../../news/data/data_source.dart';

final GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<NewsRepository>(() => NewsRepository(newsDataSource: NewsDataSource(dio: locator<Dio>())));
}