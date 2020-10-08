import 'package:flutter/material.dart';
import 'package:hacker_news_flutter/blocs/hacker_news_bloc.dart';

class ItemWidget extends StatefulWidget {
  ItemWidget(this.data, this.newsBloc);
  final int data;
  final NewsBloc newsBloc;

  @override
  _ItemWidgetState createState() => _ItemWidgetState();
}

class _ItemWidgetState extends State<ItemWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.newsBloc.getOneNews(widget.data),
      builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
        if (snapshot.hasData)
          return ListTile(
            leading: Icon(
              Icons.new_releases,
              color: Colors.blue,
              size: 40.0,
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.black,
            ),
            title: Text(snapshot.data.toString()),
            onTap: () {},
          );
        else
          return Container(
              child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
          ));
      },
    );
  }
}
