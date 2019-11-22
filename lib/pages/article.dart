import 'package:flutter/material.dart';
import 'package:news_app/models/news.dart';

class ArticlePage extends StatelessWidget {
  final Article article;

  const ArticlePage({Key key, this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(article.getAuthor),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              width: double.infinity,
              child: Image.network(
                article.getUrlToImage,
                width: double.infinity,
              ),
            ),
            Card(
              child: ListTile(
                title: Text(Article.AUTHOR.toUpperCase()),
                subtitle: Text(article.getAuthor),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(Article.TITLE.toUpperCase()),
                subtitle: Text(article.getTitle),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(Article.SOURCE.toUpperCase()),
                subtitle: Text(article.getSource['name']),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(Article.PUBLISHED_AT.toUpperCase()),
                subtitle: Text(article.getPublishedAt),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(Article.CONTENT.toUpperCase()),
                subtitle: Text(article.getContent),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
