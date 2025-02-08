import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/bloc/news_bloc.dart';
import 'package:news_app/news/data_repository.dart';
import 'news_list.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('News')),
      body: BlocProvider(
        create: (_) => NewsBloc(newsRepository: NewsRepository())..add(NewsFetched()),
        child: Padding(padding: EdgeInsets.symmetric(vertical: 16, horizontal: 12), child: const NewsList()),
      ),
    );
  }
}