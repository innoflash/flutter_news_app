import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
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
    return MultiProvider(
      providers: getProviders(),
    );
  }
}
