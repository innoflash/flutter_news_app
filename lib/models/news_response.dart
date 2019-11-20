import 'package:equatable/equatable.dart';
import 'package:news_app/models/news.dart';

class NewsResponse extends Equatable {
  static const STATUS = 'status';
  static const TOTAL_RESULTS = 'totalResults';
  static const ARTICLES = 'articles';

  final String _status;
  final int _totalResults;
  final List<Article> _articles;

  NewsResponse.fromJSON(Map<String, Object> jsonData)
      : _status = jsonData[STATUS],
        _totalResults = jsonData[TOTAL_RESULTS],
        _articles = jsonData[ARTICLES];

  ///Model getters
  List<Article> get getArticles => _articles;
  int get getTotalResults => _totalResults;
  String get getStatus => _status;

  @override
  List<Object> get props => null;
}
