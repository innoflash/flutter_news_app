import 'package:news_app/utils/constants.dart';

class API {
  static String getURL(String filterText, int page) {
    return Constants.API_BASE +
        'everything?q=' +
        Uri.encodeFull(filterText) +
        '&apiKey=' +
        Constants.NEWS_API_KEY +
        '&page=$page';
  }
}
