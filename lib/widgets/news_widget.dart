import 'package:flutter/material.dart';
import 'package:hacker_news_flutter/blocs/hacker_news_bloc.dart';

import 'item_widget.dart';

class NewsWidget extends StatefulWidget {
  const NewsWidget({
    Key key,
    @required this.newsBloc,
  }) : super(key: key);

  final NewsBloc newsBloc;

  @override
  _NewsWidgetState createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.newsBloc.newsStream,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.active:
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, i) =>
                  ItemWidget(snapshot.data[i], widget.newsBloc),
            );
            break;
          default:
            return CircularProgressIndicator();
            break;
        }
      },
    );
  }
}
