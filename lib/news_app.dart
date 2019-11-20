import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/app_config.dart';
import 'package:news_app/main.dart';
import 'package:news_app/pages/home.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:provider/provider.dart';

GetIt locator = GetIt.instance;

void registerProviders() {
  locator.registerLazySingleton(() => NewsProvider());
}

List<SingleChildCloneableWidget> getProviders() {
  return [
    ChangeNotifierProvider(
      builder: (_) => locator<NewsProvider>(),
    )
  ];
}

class NewsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appConfig = AppConfig.of(context);
    return MultiProvider(
      providers: getProviders(),
      child: MaterialApp(
        title: appConfig.appName,
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(appConfig.appName),
          ),
          body: NewsIndex(),
        ),
      ),
    );
  }
}
