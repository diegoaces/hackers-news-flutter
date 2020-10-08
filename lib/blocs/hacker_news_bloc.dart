import 'dart:async';

import 'package:dio/dio.dart';
import 'package:hacker_news_flutter/repositories/news_repository.dart';

class NewsBloc {
  final _newsStreamController = StreamController<List<int>>.broadcast();

  Stream<List<int>> get newsStream => _newsStreamController.stream;

  static final NewsBloc _singleton = new NewsBloc._();

  factory NewsBloc() {
    return _singleton;
  }
  NewsBloc._() {
    getHackerNews();
  }

  dispose() {
    _newsStreamController?.close();
  }

  getHackerNews() async {
    NewsRepository newsRepository = new NewsRepository(Dio());
    var news = await newsRepository.getAllNews();
    _newsStreamController.sink.add(news);
  }

  getOneNews(int title) async {
    NewsRepository newsRepository = new NewsRepository(Dio());
    var news = await newsRepository.getOneNews(title);

    return news;
  }
}
