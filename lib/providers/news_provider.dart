import 'package:flutter/foundation.dart';

class NewsProvider extends ChangeNotifier {
  bool _showAppBar = true;
  int _page = 1;
  List _articles = [];

  bool get getShowAppBar => _showAppBar;
  int get getPage => _page;
  List get getArticles => _articles;

  set showAppBar(bool appBarVisibility) {
    _showAppBar = appBarVisibility;
    if (!appBarVisibility) page = 1;
    notifyListeners();
  }

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  set articles(List articles) {
    //_articles.add(articles);
    _articles = articles;
    print('updating articles');
    notifyListeners();
  }

  void updateAppBarVisibility(bool state) => _showAppBar = state;

  void toggleShowAppBar() => showAppBar = !_showAppBar;

  void updatePageNumber() => page = _page++;

  void updateArticles(List newsArticles) => articles = newsArticles;
}
