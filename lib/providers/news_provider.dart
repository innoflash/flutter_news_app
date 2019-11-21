import 'package:flutter/foundation.dart';

class NewsProvider extends ChangeNotifier {
  bool _showAppBar = true;
  int _page = 0;

  bool get getShowAppBar => _showAppBar;
  int get getPage => _page;

  set showAppBar(bool appBarVisibility) {
    _showAppBar = appBarVisibility;
    notifyListeners();
  }

  set page(int page) {
    _page = page;
    notifyListeners();
  }

  void updateAppBarVisibility(bool state) => _showAppBar = state;

  void toggleShowAppBar() => showAppBar = !_showAppBar;

  void updatePageNumber() => page = _page++;
}
