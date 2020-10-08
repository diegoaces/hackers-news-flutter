import 'package:flutter/material.dart';
import 'package:hacker_news_flutter/blocs/hacker_news_bloc.dart';
import 'package:hacker_news_flutter/widgets/news_widget.dart';

class HomePage extends StatefulWidget {
  static final String routeName = 'home';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final newsBloc = new NewsBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hacker News"),
      ),
      body: Center(
        child: NewsWidget(newsBloc: newsBloc),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          newsBloc.getHackerNews();
        },
        child: Icon(Icons.sync),
      ),
    );
  }
}
