import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/news/bloc/news_bloc.dart';
import 'package:news_app/news/widgets/news_list_item.dart';

class NewsList extends StatelessWidget {
  const NewsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        switch (state.status) {
          case NewsStatus.failure:
            return const Center(child: Text('Ошибка при получении новостей'));
          case NewsStatus.success:
            if (state.news.isEmpty) {
              return const Center(child: Text('Нет новостей'));
            }
            return ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return NewsListItem(news: state.news[index]);
              },
              itemCount: state.news.length,
            );
          case NewsStatus.initial:
            return const Center(child: CircularProgressIndicator());
        }
      }
    );
  }
}
