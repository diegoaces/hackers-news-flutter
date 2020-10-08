import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hacker_news_flutter/repositories/news_repository_interface.dart';

class NewsRepository implements INewsRepository {
  final Dio _dio;

  NewsRepository(this._dio);

  @override
  Future<List<int>> getAllNews() async {
    var response =
        await _dio.get(MyConstants.hacker_news_url + "newstories.json");

    return (response.data as List<dynamic>).map((e) => e as int).toList();
  }

  Future<String> getOneNews(int title) async {
    var response =
        await _dio.get(MyConstants.hacker_news_url + "item/$title.json");
    var json = jsonEncode(response.data);

    return jsonDecode(json.toString())['title'];
  }
}

class MyConstants {
  static String hacker_news_url = "https://hacker-news.firebaseio.com/v0/";
}
