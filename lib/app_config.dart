import 'package:flutter/material.dart';

class AppConfig extends InheritedWidget {
  final String appName;
  final String apiBaseUrl;

  AppConfig(
      {@required this.appName,
      @required this.apiBaseUrl,
      @required Widget child});

  static AppConfig of(BuildContext context) {
    return context.inheritFromWidgetOfExactType(AppConfig);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return false;
  }
}
