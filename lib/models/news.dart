import 'package:equatable/equatable.dart';

class Article extends Equatable {
  static const String AUTHOR = 'author';
  static const String SOURCE = 'source';
  static const String TITLE = 'title';
  static const String DESCRIPTION = 'description';
  static const String URL = 'url';
  static const String URL_TO_IMAGE = 'urlToImage';
  static const String PUBLISHED_AT = 'publishedAt';
  static const String CONTENT = 'content';

  final Map<String, Object> _source;
  final String _author;
  final String _title;
  final String _description;
  final String _url;
  final String _urlToImage;
  final String _publishedAt;
  final String _content;

  Article.fromJSON(Map<String, Object> jsonData)
      : _author = jsonData[AUTHOR],
        _title = jsonData[TITLE],
        _url = jsonData[URL],
        _urlToImage = jsonData[URL_TO_IMAGE],
        _publishedAt = jsonData[PUBLISHED_AT],
        _content = jsonData[CONTENT],
        _source = jsonData[SOURCE],
        _description = jsonData[DESCRIPTION];

  /**
   * Initialize getters
   */

  Map<String, Object> get getSource => _source;
  String get getAuthor => _author;
  String get getTitle => _title;
  String get getDescription => _description;
  String get getUrl => _url;
  String get getUrlToImage => _urlToImage;
  String get getPublishedAt => _publishedAt;
  String get getContent => _content;

  @override
  List<Object> get props => null;
}
