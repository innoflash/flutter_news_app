import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/utils/api.dart';
import 'package:news_app/utils/constants.dart';
import 'package:news_app/utils/utils.dart';
import 'dart:async';

import 'package:provider/provider.dart';

class NewsIndex extends StatefulWidget {
  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<NewsIndex> {
  BuildContext _context;
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
      ],
    );
  }

  void searchNews(String value) {
    print(API.getURL(value, Provider.of<NewsProvider>(context).getPage));
  }
}
