import 'package:flutter/foundation.dart';

class NewsProvider extends ChangeNotifier {
  bool _showAppBar = true;

  bool get getShowAppBar => _showAppBar;

  set showAppBar(bool appBarVisibility) {
    _showAppBar = appBarVisibility;
    notifyListeners();
  }

  void updateAppBarVisibilty(bool state) => _showAppBar = state;
}
