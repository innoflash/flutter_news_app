import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';
import 'package:news_app/models/news_response.dart';
import 'package:news_app/pages/article.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/utils/api.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/utils.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:provider/provider.dart';

class NewsIndex extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsIndex> {
  BuildContext _context;
  List datas = [];
  @override
  Widget build(BuildContext context) {
    final NewsProvider newsProvider = Provider.of<NewsProvider>(context);
    _context = context;
    return Column(
      children: <Widget>[
        if (newsProvider.getShowAppBar)
          TextFormField(
            decoration: const InputDecoration(
                suffixIcon: Icon(Icons.search),
                hintText: 'Search here...',
                labelText: 'Search here...',
                alignLabelWithHint: true,
                contentPadding: EdgeInsets.all(5.0)),
            onChanged: (String value) {
              searchNews(value);
            },
            onSaved: (String value) {
              // This optional block of code can be used to run
              // code when the user saves the form.
            },
            validator: (String value) {
              return value.contains('@') ? 'Do not use the @ char.' : null;
            },
          ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: newsProvider.getArticles.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text(newsProvider.getArticles[index]['title']),
                  subtitle: Text(newsProvider.getArticles[index]['author']),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(
                        newsProvider.getArticles[index]['urlToImage']),
                  ),
                  onTap: () =>
                      openArticle(context, newsProvider.getArticles[index]),
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Future<NewsResponse> searchNews(String value) async {
    print(API.getURL(value, Provider.of<NewsProvider>(_context).getPage));
    var data = await http
        .get(API.getURL(value, Provider.of<NewsProvider>(_context).getPage));
    Provider.of<NewsProvider>(_context).updatePageNumber();
    NewsResponse newsResponse = NewsResponse.fromJSON(json.decode(data.body));
    Provider.of<NewsProvider>(_context)
        .updateArticles(newsResponse.getArticles);
  }

  void openArticle(BuildContext context, Map<String, Object> articleJSON) {
    print(articleJSON);
    Navigator.push(
        context,
        new MaterialPageRoute(
            builder: (context) => ArticlePage(
                  article: Article.fromJSON(articleJSON),
                )));
  }
}
