import 'package:dio/dio.dart';
import 'package:news_app/news/models/news.dart';
import 'package:news_app/news/models/news_api1.dart';
import 'package:news_app/news/models/news_api2.dart';

class NewsNotFoundException implements Exception {}
class NewsRequestException implements Exception {}

class NewsDataSource {
  final Dio dio;

  NewsDataSource({
    required this.dio
  });

  Future<List<NewsApi1Model>> readDataFromFirstSource() async {
    final response = await dio.get('https://cors-test.graphbots.ru/https://exams2.masqed.ru/api1');
    if (response.statusCode == 200) {
      return response.data.map<NewsApi1Model>((json) => NewsApi1Model.fromJson(json)).toList();
    } else {
      throw NewsRequestException();
    }
  }

  Future<List<NewsApi2Model>> readDataFromSecondSource() async {
    final response = await dio.get('https://cors-test.graphbots.ru/https://exams2.masqed.ru/api2');

    if (response.statusCode == 200) {
      return response.data['newsLine'].map<NewsApi2Model>((json) => NewsApi2Model.fromJson(json)).toList();
    } else {
      throw NewsRequestException();
    }
  }

  Future<List<NewsModel>> readDataFromAllSources() async {
    try {
      final results = await Future.wait([
        readDataFromFirstSource(),
        readDataFromSecondSource(),
      ]);

      final newsList = <NewsModel>[
        ...results[0],
        ...results[1],
      ];

      if (newsList.isNotEmpty) {
        return newsList;
      } else {
        throw NewsNotFoundException();
      }
    } on NewsRequestException catch (e) {
      print(e);
      throw NewsNotFoundException();
    }
  }
}