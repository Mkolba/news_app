import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:news_app/news/models/news.dart';

class NewsNotFoundException implements Exception {}
class NewsRequestException implements Exception {}

class NewsProvider {
  final dio = Dio();

  Future<List<News>> readDataFromFirstSource() async {
    final response = await dio.get('https://cors-test.graphbots.ru/https://exams2.masqed.ru/api1');
    if (response.statusCode == 200) {
      return response.data.map<News>((json) => News.fromJson(json)).toList();
    } else {
      throw NewsNotFoundException();
    }
  }

  Future<List<News>> readDataFromSecondSource() async {
    final response = await dio.get('https://cors-test.graphbots.ru/https://exams2.masqed.ru/api2');

    if (response.statusCode == 200) {
      return response.data['newsLine'].map<News>((json) => News.fromJson(json)).toList();
    } else {
      throw NewsNotFoundException();
    }
  }

  Future<List<News>> readDataFromAllSources() async {
    List<News> newsList = [];

    try {
      final newsFromFirstSource = await readDataFromFirstSource();
      newsList.addAll(newsFromFirstSource);
    } on NewsNotFoundException catch (e) {
      print(e);
    }

    try {
      final newsFromSecondSource = await readDataFromSecondSource();
      newsList.addAll(newsFromSecondSource);
    } on NewsNotFoundException catch (e) {
      print(e);
    }

    if (newsList.isNotEmpty) {
      return newsList;
    } else {
      throw NewsNotFoundException();
    }
  }
}