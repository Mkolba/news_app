import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/bloc/news_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/news/data/data_repository.dart';
import 'news_list.dart';

final getIt = GetIt.instance;

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: BlocProvider(
        create: (_) => NewsBloc(newsRepository: getIt<NewsRepository>())..add(NewsFetched()),
        child: Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12), child: const NewsList()),
      ),
    );
  }
}